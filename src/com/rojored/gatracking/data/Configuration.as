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

package com.rojored.gatracking.data
{

/**
 *  The <code>Configuration</code> class stores configuration values, such as
 *  the Analytics account Id, the cookie path and various other things.
 *
 *  @author Alberto Brealey-Guzmán alberto.brealey@gmail.com
 *  @version $Id$
 */
public class Configuration
{


    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //--------------------------------------
    //   accountId
    //--------------------------------------

    /**
     *  @private
     *  Storage for the accountId property.
     */
    private var _accountId:String;

    /**
     *  Google Analytics account Id.
     */
    public function get accountId():String
    {
        return _accountId;
    }

    /**
     *  @private
     */
    public function set accountId(value:String):void
    {
        _accountId = validateAccountId(value);
    }


    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *
     *  @param accountId Google Analytics account Id.
     *
     *  @throws ArgumentError if the accountId parameter is not valid.
     */
    public function Configuration(accountId:String)
    {
        super();

        _accountId = accountId;
    }


    //--------------------------------------------------------------------------
    //
    //  Helper methods
    //
    //--------------------------------------------------------------------------

    /** 
     *  @private
     */
    private function validateAccountId(accountId:String):String
    {
        var accountValidate:RegExp = /^UA-\d+-\d+/;

        if (!accountValidate.exec(accountId))
            throw new ArgumentError(
                "'" + accountId + "' is not a valid Analytics account Id"
                );

        return accountId;
    }


}

}
