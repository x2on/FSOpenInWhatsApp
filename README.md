# FSOpenInWhatsApp [![Build Status](https://travis-ci.org/x2on/FSOpenInWhatsApp.png)](https://travis-ci.org/x2on/FSOpenInWhatsApp) [![Cocoa Pod](https://cocoapod-badges.herokuapp.com/p/FSOpenInWhatsApp/badge.svg)](http://cocoadocs.org/docsets/FSOpenInWhatsApp/) [![Cocoa Pod](https://cocoapod-badges.herokuapp.com/v/FSOpenInWhatsApp/badge.svg)](http://cocoadocs.org/docsets/FSOpenInWhatsApp/) [![License](https://go-shields.herokuapp.com/license-MIT-blue.png)](http://opensource.org/licenses/MIT)

FSOpenInWhatsApp is a tool for sending messages with WhatsApp iOS App.

## Install
Using [CocoaPods](http://cocoapods.org/):

`pod 'FSOpenInWhatsApp', '~> 2.0'`

## iOS 9
For iOS 9 you have to add the following to your `Info.plist`:
```xml
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>whatsapp</string>
</array>
```
## Usage

Check if WhatsApp app is installed: 

```objc
if ([FSOpenInWhatsApp canSendWhatsApp]) {
	//WhatsApp app is installed
}
```

Open WhatsApp app composer:
```objc
[FSOpenInWhatsApp sendText:@"Nice app"];
```

## System support
iOS 7.0+ is currently supported.
If you need to support iOS 6.0 you could use `pod 'FSOpenInWhatsApp', '1.2'`

## License

FSOpenInWhatsApp is available under the MIT license. See the LICENSE file for more info.
