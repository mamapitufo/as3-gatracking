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
    //   domainHash
    //--------------------------------------

    /**
     *  @private
     *  Storage for the domainHash property.
     */
    private var _domainHash:String;

    /**
     *  The domain hash, used in <code>__utma</code>, <code>__utmb</code> and
     *  <code>__utmz</code> cookies.
     */
    public function get domainHash():String
    {
        return _domainHash;
    }

    //--------------------------------------
    //   visitorId
    //--------------------------------------

    /**
     *  @private
     */
    private var _visitorId:String;

    /**
     *  Random number used as a unique ID for visitors.
     */
    public function get visitorId():String
    {
        return _visitorId;
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

        initSharedObject();

        _domainHash = getDomainHash(domain);
        _visitorId = getVisitorId();
    }


    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  Initializes the local <code>SharedObject</code> and retrieves any
     *  values that are already set.
     */
    private function initSharedObject():void
    {
        // default path is "/", like in non-custom ga.js.
        sharedObject = SharedObject.getLocal("as3-gatracking", "/");
    }

    /**
     *  @private
     *  Returns the domain hash for a given domain. The hash is only generated
     *  once and stored in the shared object. For any future queries it is
     *  returned from the SO.
     *
     *  @param domain Domain for which the hash will be generated.
     */
    private function getDomainHash(domain:String):String
    {
        var domainHash:String;
        
        if (sharedObject)
            domainHash = sharedObject.data.domainHash;

        if (!domainHash)
        {
            // Here's the javascript code for generating the hash...
            /*
            function hash(d) {
                var a = 1, c = 0, h, o;
                if (d) {
                    a = 0;
                    for (h = d["length"] - 1; h >= 0; h--) {
                        o = d.charCodeAt(h);
                        a = (a << 6 & 268435455) + o + (o << 14);
                        c = a & 266338304;
                        a = c != 0 ? a ^ c >> 21 : a;
                    }
                }
                return a
            }
            */
            // and here's what we'll use for now:
            domainHash = "1";

            sharedObject.data.domainHash = domainHash;
            sharedObject.flush();
        }

        return domainHash;
    }

    /**
     *  @private
     *  Returns the unique visitor ID. The ID is only generated once and then
     *  stored on the shared object for any future queries.
     */
    private function getVisitorId():String
    {
        var visitorId:String;

        if (sharedObject)
            visitorId = sharedObject.data.visitorId;

        if (!visitorId)
        {
            // FIXME: do a better job at uniqueness...
            visitorId = String(Math.round(Math.random() * 0x7fffffff));
            sharedObject.data.visitorId = visitorId;
        }

        return visitorId;
    }


}

}
