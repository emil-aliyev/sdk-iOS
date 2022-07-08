# SkyTechChat

[![CI Status](https://img.shields.io/travis/RashadShirizadaW/SkyTechChat.svg?style=flat)](https://travis-ci.org/RashadShirizadaW/SkyTechChat)
[![Version](https://img.shields.io/cocoapods/v/SkyTechChat.svg?style=flat)](https://cocoapods.org/pods/SkyTechChat)
[![License](https://img.shields.io/cocoapods/l/SkyTechChat.svg?style=flat)](https://cocoapods.org/pods/SkyTechChat)
[![Platform](https://img.shields.io/cocoapods/p/SkyTechChat.svg?style=flat)](https://cocoapods.org/pods/SkyTechChat)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
 1. APP_ID 
 2. API_KEY

## Installation

SkyTechChat is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SkyTechChat'
```

## Configuration
You can configure details in your AppDelegate.swift

        import SkyTechChat

        let params: [String:Any] = [
            "language": "en", // language code, default is auto
            "contact": [ // set contacts default and custom fields
                "email": "YOUR_EMAIL",
                "fullname": "YOUR_FULLNAME",
                "phone": "YOUR_PHONE"
                       ]
        ]
        
        let config = ChatConfiguration(apiKey: "YOUR_API_KEY", appId: "YOUR_APP_ID", params: params)
        ChatManager.configuration = config

## Author

SkyTech
## License

SkyTechChat is available under the MIT license. See the LICENSE file for more info.
