//
//  FSOpenInWhatsApp.m
//  FSOpenInWhatsApp
//
//  Created by Felix Schulze on 27.06.2014
//  Copyright (c) 2014 Felix Schulze. All rights reserved.
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

#import "FSOpenInWhatsApp.h"

#define WHATSAPP_URL_SCHEME @"whatsapp://"

static NSString *encodeByAddingPercentEscapes(NSString *input) {
    NSString *encodedValue = (__bridge_transfer NSString *) CFURLCreateStringByAddingPercentEscapes(
            kCFAllocatorDefault,
            (__bridge CFStringRef) input,
            NULL,
            (CFStringRef) @"!*'();:@&=+$,/?%#[]",
            kCFStringEncodingUTF8);
    return encodedValue;
}

@implementation FSOpenInWhatsApp

+ (BOOL)canSendWhatsApp {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:WHATSAPP_URL_SCHEME]];
}

+ (BOOL)sendText:(NSString *)text {
    return [FSOpenInWhatsApp sendText:text toAddressBookId:nil];
}

+ (BOOL)sendText:(NSString *)text toAddressBookId:(NSString *)addressBookId {
    if ([FSOpenInWhatsApp canSendWhatsApp]) {
        
        NSMutableString *urlString = [NSMutableString string];
        [urlString appendString:WHATSAPP_URL_SCHEME];
        [urlString appendString:@"send?"];
        if (addressBookId) {
            [urlString appendString:@"abid="];
            [urlString appendString:encodeByAddingPercentEscapes(addressBookId)];
            [urlString appendString:@"&"];
        }
        if (text) {
            [urlString appendString:@"text="];
            [urlString appendString:encodeByAddingPercentEscapes(text)];
        }

        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    }
    return NO;
}


@end
