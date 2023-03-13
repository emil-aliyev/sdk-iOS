# SkyTech-Chat

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
pod 'SkyTech-Chat'
```

## Configuration
You can configure details in your AppDelegate.swift

        import SkyTech_Chat

        let params: [String:Any] = [
            "language": "en", // language code, default is auto
            "contact": [ // set contacts default and custom fields
                "email": "YOUR_EMAIL",
                "fullname": "YOUR_FULLNAME",
                "phone": "YOUR_PHONE"
                       ],
             
             "identity":[
                "field":"email"
            ]
        ]
        
        let config = ChatConfiguration(apiKey: "YOUR_API_KEY", appId: "YOUR_APP_ID", deviceToken: "YOUR_DEVICE_TOKEN", deviceOS: "ios", params: payload)
        ChatManager.configuration = config
        
## Notification redirection
You can check 'type' field to make sure notification is received from chat. "type"="livechat".

## Identity verification
Choose how you want to identify your users uniquely. Note that you can choose only email and phone from the default contact fields. Additionally, you can use any text and integer-based custom fields to identify your users. Make sure that you provide a value for that unique field in the contact object and also set it as a field value in identity object.

## Logout
In order to logout from chat, you can logout function.

## Author

SkyTech
## License

SkyTechChat is available under the MIT license. See the LICENSE file for more info.
