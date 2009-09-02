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
 *  The <code>RequestVariables</code> class encapsulates all of the possible
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
     *  @private
     *  Storage for the utmac property.
     */
    private var _utmac:String;

    /**
     *  Account string.
     *
     *  <p>The value of this property is not URL-encoded in the request.</p>
     *
     *  <p>This parameter is mandatory; it must appear on every request, it
     *  must be non-empty.</p>
     */
    public function get utmac():String
    {
        return encodeURIComponent(_utmac);
    }

    /**
     *  @private
     */
    public function set utmac(value:String):void
    {
        if (/^UA-\d+-\d+$/.test(value))
            _utmac = value;
        else
            throw new Error(
                "'" + value + "' is not a valid Google Analytics account"
                );
    }

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
     *  <p>This parameter is optional.</p>
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
     *  <p>This parameter is optional.</p>
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
     *  <p>Event data, encoded; FIXME: figure the format.</p>
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

    // FIXME: Missing properties, not yet implemented:
    //  utmipc
    //  utmipn
    //  utmipr
    //  utmiqt
    //  utmiva

    //--------------------------------------
    //   utmje
    //--------------------------------------

    /**
     *  Whether the browser is Java-enabled.
     *
     *  <p>Possible values are <code>1</code> (true) or <code>0</code>
     *  (false).
     *
     *  <p>This parameter is optional.</p>
     */
    public var utmje:String;

    //--------------------------------------
    //   utmn
    //--------------------------------------

    /**
     *  Unique generater request ID, used to prevent caching of the GIF image.
     *
     *  <p>Our implementation uses epoch time when the request is made as a
     *  value.</p>
     *
     *  <p>This parameter is mandatory, but it would be handled by the
     *  library.</p>
     */
    public var utmn:String;

    //--------------------------------------
    //   utmp
    //--------------------------------------

    /**
     *  Page name.
     *
     *  <p>The value of this property is URL-encoded in the request.</p>
     *
     *  <p>This parameter is mandatory.</p>
     */
    public var utmp:String;

    //--------------------------------------
    //   utmr
    //--------------------------------------

    /**
     *  Referrer.
     *
     *  <p>Complete URL, including request parameters. The value of this
     *  property is URL-encoded.</p>
     *
     *  <p>This parameter is optional.</p>
     */
    public var utmr:String;

    //--------------------------------------
    //   utmsc
    //--------------------------------------

    /**
     *  Screen color depth.
     *
     *  <p>The value of this property is URL-encoded.</p>
     *
     *  <p>This parameter is optional.</p>
     */
    public var utmsc:String;

    //--------------------------------------
    //   utmsr
    //--------------------------------------

    /**
     *  Screen resolution.
     *
     *  <p>The value of this property is URL-encoded.</p>
     *
     *  <p>This parameter is optional.</p>
     */
    public var utmsr:String;

    //--------------------------------------
    //   utmt
    //--------------------------------------

    /**
     *  Type variable applied to events (<code>utmt=event</code>),
     *  transactions, items and user-defined variables.
     *
     *  <p>The value of this property is URL-encoded.</p>
     *
     *  <p>This parameter is mandatory for events.</p>
     */
    public var utmt:String;

    // FIXME: Missing properties, not yet implemented:
    //  utmtci
    //  utmtco
    //  utmtid
    //  utmtrg
    //  utmtsp
    //  utmtst
    //  utmtto
    //  utmttx

    //--------------------------------------
    //   utmul
    //--------------------------------------

    /**
     *  Browser language.
     *
     *  <p>The value of this property is URL-encoded.</p>
     *
     *  <p>This parameter is optional.</p>
     */
    public var utmul:String;

    //--------------------------------------
    //   utmwv
    //--------------------------------------

    /**
     *  Tracking code version.
     *
     *  <p>FIXME: not sure how this works, using "4" for now.</p>
     *
     *  <p>The value of this property is not URL-encoded.</p>
     *
     *  <p>This parameter is optional.</p>
     */
    public var utmwv:String = "4";


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


    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    /**
     *  Concatenates all defined properties, to be used as <code>GET</code>
     *  parameters.
     */
    public function toString():String
    {
        var params:Array = [];

        if (utmwv)
            params.push("utmwv=" + encodeURIComponent(utmwv));
        params.push("utmn=" + new Date().time);
        if (utmhn)
            params.push("utmhn=" + encodeURIComponent(utmhn));
        if (utmt)
            params.push("utmt=" + encodeURIComponent(utmt));
        if (utme)
            params.push("utme=" + encodeURIComponent(utme));
        params.push("utmp=" + encodeURIComponent(utmp));
        if (utmac)
            params.push("utmac=" + utmac);
        if (utmcc)
            params.push("utmcc=" + utmcc);

        return params.join("&");
    }

}

}
