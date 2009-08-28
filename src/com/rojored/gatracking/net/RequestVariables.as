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
 *  The <code>RequestVariables</code> encapsulates all of the possible
 *  <code>__utm.gif</code>'s request parameters.
 *
 *  @author Alberto Brealey-Guzmán alberto.brealey@gmail.com
 *  @version $Id$
 */
public class RequestVariables
{


    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //--------------------------------------
    //   utmac
    //--------------------------------------

    /**
     *  Account string.
     *
     *  <p>The value of this property is not URL-encoded in the request.</p>
     *
     *  <p>This parameter is mandatory; it must appear on every request, it
     *  must be non-empty.</p>
     */
    public var utmac:String;

    //--------------------------------------
    //   utmcc
    //--------------------------------------

    /**
     *  Cookie values. This parameters encodes all the cookies requested from
     *  the page.
     *
     *  <p>The value for this property is URL-encoded in the request.</p>
     *
     *  <p>This parameter is mandatory; it must appear on every request, it
     *  must be non-empty.</p>
     */
    public var utmcc:String;

    //--------------------------------------
    //   utmcn
    //--------------------------------------

    /**
     *  Starts a new campaign session.
     *
     *  <p>Either <code>utmcn</code> or <code>utmcr</code> is present on any
     *  given request. Possible values for this parameter are <code>1</code>
     *  (true) or <code>0</code> (false).</p>
     *
     *  <p>FIXME: Not sure if the parameter is mandatory. This functionality
     *  is not yet implemented.</p>
     */
    public var utmcn:String;

    //--------------------------------------
    //   utmcr
    //--------------------------------------

    /**
     *  Indicates a repeat campaign visit.
     *
     *  <p>Either <code>utmcn</code> or <code>utmcr</code> is present on any
     *  given request. Possible values for this parameter are <code>1</code>
     *  (true) or <code>0</code> (false).</p>
     *
     *  <p>FIXME: Not sure if the parameter is mandatory. This functionality
     *  is not yet implemented.</p>
     */
    public var utmcr:String;

    //--------------------------------------
    //   utmcs
    //--------------------------------------

    /**
     *  Browser language encoding.
     *
     *  <p>The value of this property is not URL-encoded in the request.</p>
     *
     *  <p>This parameter is optional. If it's not set by the browser, the
     *  default is used.</p>
     *
     *  @default -
     */
    public var utmcs:String = "-";

    //--------------------------------------
    //   utmdt
    //--------------------------------------

    /**
     *  Page title.
     *
     *  <p>The value of this property is URL-Encoded in the request.</p>
     *
     *  <p>This parameter is optional.</p>
     */
    public var utmdt:String;

    //--------------------------------------
    //   utme
    //--------------------------------------

    /**
     *  Event tracking data.
     *
     *  <p>Event data, encoded; FIXME: not sure about the format.</p>
     *
     *  <p>This parameter is optional, used in event tracking.</p>
     */
    public var utme:String;

    //--------------------------------------
    //   utmfl
    //--------------------------------------

    /**
     *  Adobe Flash Player version.
     *
     *  <p>The value of this property is URL-encoded in the request.</p>
     *
     *  <p>This parameter is optional.</p>
     */
    public var utmfl:String;

    //--------------------------------------
    //   utmhn
    //--------------------------------------

    /**
     *  Host name.
     *
     *  <p>The value of this property is URL-encoded in the request.</p>
     *
     *  <p>Mandatory, since Analytics tracks sites.</p>
     */
    public var utmhn:String;

    // FIXME: Missing properties, not yet implemented: utmipc, utmipn, utmipr,
    // utmiqt, utmiva.

    //--------------------------------------
    //   utmje
    //--------------------------------------

    /**
     *  Whether the browser is Java-enabled.
     *
     *  <p>Possible values are <code>1</code> (true) or <code>0</code>
     *  (false).
     *
     *  <p>Optional.</p>
     */
    public var utmje:String;

    //--------------------------------------
    //   utmn
    //--------------------------------------

    /**
     *  Unique generater request ID, to prevent caching of the GIF image.
     *
     *  <p>Our implementation uses epoch time when the request is made as a
     *  value.</p>
     *
     *  <p>Mandatory.</p>
     */
    public var utmn:String;

    //--------------------------------------
    //   utmp
    //--------------------------------------

    /**
     *  Page name.
     *
     *  <p>The value of this property is not URL-encoded in the request.</p>
     *
     *  <p>Mandatory.</p>
     */
    public var utmp:String;


    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor
     */
    public function RequestVariables()
    {
        super();
    }
}

}
