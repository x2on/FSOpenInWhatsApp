Pod::Spec.new do |s|
  s.name         = "FSOpenInWhatsApp"
  s.version      = "2.1"
  s.summary      = "FSOpenInWhatsApp is a tool for sending messages with WhatsApp iOS App."
  s.homepage     = "https://github.com/x2on/FSOpenInWhatsApp"
  s.social_media_url = 'https://twitter.com/x2on'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Felix Schulze" => "mail@felixschulze.de" }
  s.source       = {
    :git => "https://github.com/x2on/FSOpenInWhatsApp.git",
    :tag => s.version.to_s
  }

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'FSOpenInWhatsApp.{h,m}'
  s.framework	 = 'Foundation', 'UIKit'
end