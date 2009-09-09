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

package com.rojored.gatracking
{

import com.rojored.gatracking.data.Configuration;
import com.rojored.gatracking.net.CookieJar;
import com.rojored.gatracking.net.RequestVariables;
import com.rojored.gatracking.system.Environment;
import flash.display.DisplayObject;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.system.LoaderContext;

/**
 *  Barebones Actionscript3 implementation of the Google Analytics data
 *  collection API.
 *
 *  <p>Only a small subset of the API is implemented: page view and event
 *  tracking. No tracking customization functionality is available.</p>
 *
 *  @author Alberto Brealey-Guzmán alberto.brealey@gmail.com
 *  @version $Id$
 */
public class AnalyticsTracker
{


    //--------------------------------------------------------------------------
    //
    //  Class constants
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     */
    private static const TRACK_GIF_URL:String = "http://www.google-analytics.com/__utm.gif";

    /**
     *  @private
     */
    private static const API_VERSION:String = "4.3";


    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    // FIXME: there should be some sort of queueing, in case a tracking
    // request is pending when a new one is made.
    /**
     *  @private
     *  Loader used in tracking requests.
     */
    private var loader:Loader;


    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //--------------------------------------
    //   configuration
    //--------------------------------------

    /**
     *  Analytics configuration.
     */
    public var configuration:Configuration;

    //--------------------------------------
    //   environment
    //--------------------------------------

    /**
     *  Environment information.
     */
    public var environment:Environment;

    //--------------------------------------
    //   cookieJar
    //--------------------------------------

    /**
     *  Persistent values needed for cookie management.
     */
    public var cookieJar:CookieJar;

    //--------------------------------------
    //   lastPage
    //--------------------------------------

    /**
     *  Last tracked pageview.
     */
    public var lastPage:String;


    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *
     *  @param display Display object used to get environment information.
     *  The instance must be attached to the display list.
     *  @param accountId Google Analytics account string.
     *
     *  @throws ArgumentError if the accountId parameter is not valid.
     */
    public function AnalyticsTracker(display:DisplayObject, accountId:String)
    {
        super();

        configuration = new Configuration(accountId);
        environment = new Environment(display);
        cookieJar = new CookieJar(environment.hostname);
    }


    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    /**
     *  Tracks a page view.
     *
     *  @param pageURL Page identifier.
     */
    public function trackPageview(pageURL:String = ""):void
    {
        var variables:RequestVariables = new RequestVariables();
        variables.utmp = pageURL;
        lastPage = pageURL;

        trackRequest(variables);
    }

    /**
     *  Tracks an event.
     */
    public function trackEvent(category:String,
                               action:String,
                               label:String = null,
                               value:Number = NaN):void
    {
        var variables:RequestVariables = new RequestVariables();
        variables.utmp = lastPage;
        variables.utmt = "event";

        variables.utme = "5(" + category + "*" + action;
        variables.utme += label ? "*" + label : "";
        variables.utme += ")";
        variables.utme += isNaN(value) ? "" : "(" + value + ")";

        trackRequest(variables);
    }


    //--------------------------------------------------------------------------
    //
    //  Helper methods
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  Make a tracking request.
     *
     *  @param variables RequestVariables instance with additional parameters.
     */
    private function trackRequest(variables:RequestVariables = null):void
    {
        if (!variables)
            variables = new RequestVariables();

        // Default parameters.
        variables.utmac = configuration.accountId;
        variables.utmhn = environment.hostname;
        variables.utmwv = API_VERSION;
        variables.utmsr = environment.screenResolution;
        variables.utmfl = environment.flashPlayerVersion;
        variables.utmcc = encodeURI("__utma=" + cookieJar.generateNewUTMAValue());

        var request:URLRequest = new URLRequest(TRACK_GIF_URL);
        request.method = URLRequestMethod.GET;
        request.data = variables.toString();

        loader = new Loader();

        loader.contentLoaderInfo.addEventListener(
            Event.COMPLETE,
            loader_completeHandler
            );
        loader.contentLoaderInfo.addEventListener(
            IOErrorEvent.IO_ERROR,
            loader_ioErrorHandler
            );

        // use LoaderContext to prevent security errors.
        loader.load(request, new LoaderContext());
    }

    /**
     *  @private
     */
    private function removeLoaderListeners():void
    {
        loader.contentLoaderInfo.removeEventListener(
            Event.COMPLETE,
            loader_completeHandler
            );
        loader.contentLoaderInfo.removeEventListener(
            IOErrorEvent.IO_ERROR,
            loader_ioErrorHandler
            );
    }


    //--------------------------------------------------------------------------
    //
    //  Event handlers: loader
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     */
    private function loader_completeHandler(event:Event):void
    {
        trace("track complete");
        removeLoaderListeners();
    }

    /**
     *  @private
     */
    private function loader_ioErrorHandler(event:IOErrorEvent):void
    {
        trace("track IOError:", event);
        removeLoaderListeners();
    }


}

}
