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

/**
 *  The <code>Cookie</code> class represents a single "cookie" (cookie
 *  functionality is simulated through flash player's
 *  <code>SharedObject</code>.
 *
 *  @author Alberto Brealey-Guzmán alberto.brealey@gmail.com
 *  @version $Id$
 */
public class Cookie
{


    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //--------------------------------------
    //   content
    //--------------------------------------

    /**
     *  The value stored in the cookie.
     */
    public var content:String;

    //--------------------------------------
    //   domain
    //--------------------------------------

    /**
     *  The domain for which this cookie is used.
     */
    public var domain:String;

    //--------------------------------------
    //   expiration
    //--------------------------------------

    /**
     *  Cookie expiration time. After this date and time the cookie is
     *  discarded.
     */
    public var expiration:Date;

    //--------------------------------------
    //   name
    //--------------------------------------

    /**
     *  Cookie name. This is just a string identifier.
     */
    public var name:String;

    //--------------------------------------
    //   path
    //--------------------------------------

    /**
     *  Path in the <code>domain</code> for which this cookie is used.
     *
     *  @default /
     */
    public var path:String = "/";


    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     */
    public function Cookie(name:String = null,
                           domain:String = null,
                           path:String = "/",
                           expiration:Date = null,
                           content:String = null)
    {
        this.name = name;
        this.domain = domain;
        this.path = path;
        this.expiration = expiration;
        this.content = content;
    }

}

}
