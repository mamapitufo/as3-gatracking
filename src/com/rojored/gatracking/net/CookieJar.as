////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (c) 2009 Gabriel Montagné Láscaris-Comneno and Alberto
//  Brealey-Guzmán.
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//
////////////////////////////////////////////////////////////////////////////////

package com.rojored.gatracking.net
{

import flash.net.SharedObject;

/**
 *  The <code>CookieJar</code> class stores the persistent values for the
 *  "umt cookies" used in Google Analytics tracking.
 *
 *  <p>Persistent values are kept using flash's <code>SharedObject</code>.
 *
 *  @author Alberto Brealey-Guzmán alberto.brealey@gmail.com
 *  @version $Id$
 */
public class CookieJar
{


    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  The local SharedObject for persistent data storage.
     */
    private var sharedObject:SharedObject;


    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //--------------------------------------
    //   domain
    //--------------------------------------

    /**
     *  @private
     *  Storage for the domain property
     */
    private var _domain:String;

    /**
     *  The domain name for which this jar stores cookie values.
     */
    public function get domain():String
    {
        return _domain;
    }

    //--------------------------------------
    //   domainHash
    //--------------------------------------

    /**
     *  @private
     *  Storage for the domainHash property.
     */
    private var _domainHash:int;

    /**
     *  The domain hash, used in <code>__utma</code>, <code>__utmb</code> and
     *  <code>__utmz</code> cookies.
     */
    public function get domainHash():int
    {
        return _domainHash;
    }

    //--------------------------------------
    //   visitorId
    //--------------------------------------

    /**
     *  @private
     *  Storage for the visitorId property.
     */
    private var _visitorId:int;

    /**
     *  Random number used as a unique ID for visitors.
     */
    public function get visitorId():int
    {
        return _visitorId;
    }

    //--------------------------------------
    //   firstVisit
    //--------------------------------------

    /**
     *  @private
     *  Storage for the firstVisit property
     */
    private var _firstVisit:Number;

    /**
     *  Timestamp of the user's first visit, in UXIX epoch.
     */
    public function get firstVisit():Number
    {
        return _firstVisit;
    }

    //--------------------------------------
    //   lastVisit
    //--------------------------------------

    /**
     *  @private
     *  Storage for the lastVisit property.
     */
    private var _lastVisit:Number;

    /**
     *  Timestamp of the user's last visit, in UNIX epoch.
     */
    public function get lastVisit():Number
    {
        return _lastVisit;
    }

    //--------------------------------------
    //   numSessions
    //--------------------------------------

    /**
     *  @private
     *  Storage for the numSessions property
     */
    private var _numSessions:Number = 0;

    /**
     *  Number of sessions the user has had since their first visit.
     */
    public function get numSessions():Number
    {
        return _numSessions;
    }

    //--------------------------------------
    //   utmaExpiration
    //--------------------------------------

    /**
     *  @private
     *  Storage for the utmaExpiration property
     */
    private var _utmaExpiration:int;

    /**
     *  Expiration date for the utma cookie, in UNIX epoch time.
     */
    public function utmaExpiration():int
    {
        return _utmaExpiration;
    }


    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *
     *  @param domain The domain name for which the <code>CookieJar</code>
     *  will manage cookies.
     */
    public function CookieJar(domain:String)
    {
        super();

        _domain = domain;
        initValues();
    }


    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    /**
     *  Generate a new value for the utma cookie, updating the
     *  <code>lastVisit</code> and <code>utmaExpiration</code> properties.
     */
    public function generateNewUTMAValue():String
    {
        var now:int = Math.round(new Date().time / 1000);
        var previous:int = lastVisit;

        _utmaExpiration = now + 63072000; // 2 years, 3600 * 24 * 365 * 2
        _lastVisit = now;
        flushValues();

        return [ domainHash, visitorId, firstVisit, previous, now, numSessions ].join(".") + ";";
    }

    /**
     *  @private
     *  Initializes the local <code>SharedObject</code> and retrieves any
     *  values that are already set.
     */
    private function initValues():void
    {
        // default path is "/", like in non-custom ga.js.
        sharedObject = SharedObject.getLocal("as3-gatracking", "/");

        var now:int = Math.round(new Date().time / 1000);

        if (sharedObject.data.domain)
        {
            // repeat visit, retrieve values.
            _domainHash = sharedObject.data.domainHash;
            _visitorId = sharedObject.data.visitorId;
            _firstVisit = sharedObject.data.firstVisit;
            _lastVisit = sharedObject.data.lastVisit;
            _numSessions = sharedObject.data.numSessions;
        }
        else
        {
            // first time here.
            sharedObject.data.domain = domain;

            _domainHash = sharedObject.data.domainHash = getDomainHash(domain);
            _visitorId = sharedObject.data.visitorId = getVisitorId();
            _firstVisit = sharedObject.data.firstVisit = now;
            _lastVisit = sharedObject.data.lastVisit = now;
            _numSessions = sharedObject.data.numSessions = 1;
        }

        _utmaExpiration = now + 63072000; // 2 years, 3600 * 24 * 365 * 2
        flushValues();
    }

    /**
     *  @private
     *  Flushes current values to disk via the local <code>SharedObject</code>
     *  instance.
     */
    private function flushValues():void
    {
        sharedObject.data.domainHash = domainHash;
        sharedObject.data.visitorId = visitorId;
        sharedObject.data.firstVisit = firstVisit;
        sharedObject.data.lastVisit = lastVisit;
        sharedObject.data.numSessions = numSessions;
        sharedObject.data.utmaExpiration = utmaExpiration;

        sharedObject.flush();
    }

    /**
     *  @private
     *  Returns the domain hash for a given domain. The hash is only generated
     *  once and stored in the shared object. For any future queries it is
     *  returned from the SO.
     *
     *  @param domain Domain from which a hash will be generated.
     */
    private function getDomainHash(domain:String):int
    {
        var domainHash:int;
        
        if (sharedObject)
            domainHash = sharedObject.data.domainHash;

        if (!domainHash)
        {
            domainHash = generateHash(domain);
            _domainHash = domainHash;
            flushValues();
        }

        return domainHash;
    }

    /**
     *  @private
     *  Generates a numeric hash from a string value.
     *
     *  <p>Code taken from <a
     *  href="http://www.google.com/support/forum/p/Google+Analytics/thread?tid=626b0e277aaedc3c&hl=en">the
     *  Google Analytics help forum</a>.</p>
     *
     *  @param input String from which a numeric hash will be generated.
     */
    private function generateHash(input:String):int
    {
        var hash:int = 1;
        if (input)
        {
            hash = 0;
            for (var i:int = input.length - 1; i >= 0; i--)
            {
                var charCode:int = input.charCodeAt(i);
                hash = (hash << 6 & 0xfffffff) + charCode + (charCode << 14);
                var left:int = hash & 0xfe00000;
                if (left != 0) hash ^= left >> 21;
            }

        }
        return hash;
    }

    /**
     *  @private
     *  Returns the unique visitor ID. The ID is only generated once and then
     *  stored on the shared object for any future queries.
     */
    private function getVisitorId():int
    {
        var visitorId:int;

        if (sharedObject)
            visitorId = sharedObject.data.visitorId;

        if (!visitorId)
        {
            // FIXME: do a better job at generating uniqueness...
            visitorId = generateHash(
                Math.round(Math.random() * 0x7fffffff).toString()
                );

            _visitorId = visitorId;
            flushValues();
        }

        return visitorId;
    }


}

}
