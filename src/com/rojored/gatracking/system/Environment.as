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

package com.rojored.gatracking.system
{

import flash.display.DisplayObject;
import flash.system.Capabilities;

/**
 *  The <code>Environment</code> class provides information about the system
 *  on which the SWF file is running.
 *
 *  @author Alberto Brealey-Guzmán alberto.brealey@gmail.com
 *  @version $Id$
 */
public class Environment
{


    //--------------------------------------------------------------------------
    //
    //  Class constants
    //
    //--------------------------------------------------------------------------

    /**
     *  Value for the protocol property when the SWF file was served over HTTP.
     */
    public static const PROTOCOL_HTTP:String = "protocolHTTP";

    /**
     *  Value for the protocol property when the SWF file was served over secure
     *  HTTP.
     */
    public static const PROTOCOL_HTTPS:String = "protocolHTTPS";

    /**
     *  Value for the protocol property when the SWF file was accessed via the
     *  filesystem.
     */
    public static const PROTOCOL_FILE:String = "protocolFile";


    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //--------------------------------------
    //   hostname
    //--------------------------------------

    /**
     *  @private
     *  Storage for the hostname property.
     */
    private var _hostname:String = "";

    /**
     *  Hostname from where the SWF file was loaded.
     */
    public function get hostname():String
    {
        return _hostname;
    }

    //--------------------------------------
    //   path
    //--------------------------------------

    /**
     *  @private
     *  Storage for the path property.
     */
    private var _path:String;

    /**
     *  Path on the server from where the SWF file was loaded.
     */
    public function get path():String
    {
        return _path;
    }

    //--------------------------------------
    //   protocol
    //--------------------------------------

    /**
     *  @private
     *  Storage for the protocol property.
     */
    private var _protocol:String = PROTOCOL_HTTP;

    /**
     *  Protocol via which the SWF file was loaded.
     *
     *  <p>Possible values for this property are:</p>
     *  <ul>
     *      <li>Environment.PROTOCOL_HTTP: for files served over HTTP. This is
     *      the default value if the URL of the SWF file can not be
     *      determined.</li>
     *      <li>Environment.PROTOCOL_HTTPS: for files served over secure
     *      HTTP.</li>
     *      <li>Environment.PROTOCOL_FILE: for local files.</li>
     *  </ul>
     */
    public function get protocol():String
    {
        return _protocol;
    }

    //--------------------------------------
    //   flashPlayerVersion
    //--------------------------------------

    /**
     *  @private
     *  Storage for the flashPlayerVersion property.
     */
    private var _flashPlayerVersion:String;

    /**
     *  Flash player version string.
     */
    public function get flashPlayerVersion():String
    {
        return _flashPlayerVersion;
    }


    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *
     *  <p>Creates a new <code>Environment</code> instance, using the provided
     *  <code>DisplayObject</code> to get the URL from where the SWF file was
     *  served.
     *
     *  @param display <code>DisplayObject</code> instance added to the SWF
     *  file display list. If this parameter is not provided then the current
     *  URL will be gathered via <code>ExternalInterface</code>.
     */
    public function Environment(display:DisplayObject = null)
    {
        super();

        if (display && display.root && display.root.loaderInfo)
            parseURL(display.root.loaderInfo.url);

        loadCapabilities();
    }


    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  Parses a URL and extracts the hostname and the protocol.
     *
     *  TODO: get utm* parameters from the URL, for cross-site analytics
     *  tracking.
     *
     *  @param url URL for the current SWF.
     */
    private function parseURL(url:String):void
    {
        // FIXME: better handling of file:// URLs, to get the path from them.
        var urlParser:RegExp = 
            new RegExp("^(?P<proto>https?)://(?P<domain>[^/]+)(?P<path>/.*/)[^/]\??");
        var results:Object = urlParser.exec(url);

        if (results)
        {
            _hostname = results.domain;
            _protocol = (results.proto == "http" ? PROTOCOL_HTTP : PROTOCOL_HTTPS);
            _path = results.path;
        }
        else
        {
            _hostname = "localhost";
            _protocol = PROTOCOL_FILE;
            _path = "/";
        }
    }

    /**
     *  @private
     *  Get system capabilities, such as screen resolution, color depth,
     *  browser locale.
     */
    private function loadCapabilities():void
    {
        // TODO: need to parse this...
        //_flashPlayerVersion = Capabilities.version;
    }


}

}
