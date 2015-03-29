//
//  FSOpenInWhatsApp.h
//  FSOpenInWhatsApp
//
//  Created by Felix Schulze on 27.06.2014
//  Copyright (c) 2014-2015 Felix Schulze. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <Foundation/Foundation.h>

@interface FSOpenInWhatsApp : NSObject

/**
 *  Check if WhatsApp is installed.
 *
 *  @return true if sending text with WhatsApp is possible.
 */
+ (BOOL)canSendWhatsApp;

/**
 *  Send a text with WhatsApp.
 *  It automatically checks if WhatsApp is installed.
 *
 *  @param text string for sending
 *
 *  @return true if successful, false if not successful or WhatsApp is not installed
 */
+ (BOOL)sendText:(NSString *)text;

/**
 *  Send a text with WhatsApp to a specific addressbook id.
 *  It automatically checks if WhatsApp is installed.
 *
 *  @param text          string for sending
 *  @param addressBookId specific addressbook id
 *
 *  @return true if successful, false if not successful or WhatsApp is not installed
 */
+ (BOOL)sendText:(NSString *)text toAddressBookId:(NSString *)addressBookId;

@end