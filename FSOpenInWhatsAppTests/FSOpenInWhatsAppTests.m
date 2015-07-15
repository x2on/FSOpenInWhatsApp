//
//  FSOpenInWhatsApp.m
//  FSOpenInWhatsApp
//
//  Created by Felix Schulze on 27.06.15.
//  Copyright (c) 2015 Felix Schulze. All rights reserved.
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
#import <XCTest/XCTest.h>
#import "FSOpenInWhatsApp.h"

@interface FSOpenInWhatsApp ()
+ (NSURL *)urlForText:(NSString *)text toAddressBookId:(NSString *)addressBookId;
@end

@interface FSOpenInWhatsAppTests : XCTestCase
@end

@implementation FSOpenInWhatsAppTests

- (void)testUrlStringWithText {
    XCTAssertEqualObjects([FSOpenInWhatsApp urlForText:@"some text" toAddressBookId:nil], [NSURL URLWithString:@"whatsapp://send?text=some%20text"]);
}

- (void)testUrlStringWithAddressBookId {
    XCTAssertEqualObjects([FSOpenInWhatsApp urlForText:@"some text" toAddressBookId:@"12345"], [NSURL URLWithString:@"whatsapp://send?abid=12345&text=some%20text"]);
}

- (void)testUrlStringWithLongText {
    XCTAssertEqualObjects([FSOpenInWhatsApp urlForText:@"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam" toAddressBookId:nil], [NSURL URLWithString:@"whatsapp://send?text=Lorem%20ipsum%20dolor%20sit%20amet%2C%20consetetur%20sadipscing%20elitr%2C%20sed%20diam%20nonumy%20eirmod%20tempor%20invidunt%20ut%20labore%20et%20dolore%20magna%20aliquyam"]);
}

- (void)testUrlStringWithSpecialChars {
    XCTAssertEqualObjects([FSOpenInWhatsApp urlForText:@"some text with % & / ( ) $ special chars" toAddressBookId:nil], [NSURL URLWithString:@"whatsapp://send?text=some%20text%20with%20%25%20%26%20%2F%20%28%20%29%20%24%20special%20chars"]);
}

- (void)testUrlStringWithSpecialCharsThatShouldBeDecoded {
    XCTAssertEqualObjects([FSOpenInWhatsApp urlForText:@"!*'();:@&=+$,/?%#[]" toAddressBookId:nil], [NSURL URLWithString:@"whatsapp://send?text=%21%2A%27%28%29%3B%3A%40%26%3D%2B%24%2C%2F%3F%25%23%5B%5D"]);
}

@end
