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

/**
 *  Barebones Actionscript3 implementation of the Google Analythics data
 *  collection API.
 *
 *  <p>Only a small subset of the API is implemented: page view and event
 *  tracking. No tracking customization functionality is available.</p>
 *
 *  @author Alberto Brealey-Guzmán alberto.brealey@gmail.com
 *  @version $Id$
 */
public class GATracker
{


    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  Account string.
     */
    private var accountId:String;


    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *
     *  @param accountId Google Analythincs account string.
     */
    public function GATracker(accountId:String)
    {
        super();

        this.accountId = accountId;
    }


}

}
