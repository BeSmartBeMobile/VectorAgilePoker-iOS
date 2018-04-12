# VMRemoteConfig

[![License](https://img.shields.io/badge/license-VECTOR-blue.svg)](https://gitlab.vectoritcgroup.com/ios-modules/VMRemoteConfig/blob/master/LICENSE)
[![Versión de pod](https://img.shields.io/badge/pod-1.0.1-green.svg)](https://gitlab.vectoritcgroup.com/ios-modules/VMRemoteConfig/commits/1.0.1)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

[LINK to the module wiki](https://gitlab.vectoritcgroup.com/docs/wiki/wikis/VMRemoteConfig)


## Requirements

- Swift 3+
- iOS 9+ 

## Installation

VMRemoteConfig is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "VMRemoteConfig"
```

## Use

First, import the library in your appDelegate:
```
import VMRemoteConfig
```

Then you only have to put this line in the applicationDidBecomeActive() method of your app:
```
VMRemoteConfig.check(url: https://your-remote-app-config-url.json)
```

Be sure to provide a valid url where you have hosted a json file with the [correct format
](https://gitlab.vectoritcgroup.com/docs/wiki/wikis/VMRemoteConfig#ejemplo-json)

## Author

Jorge Lucena, jmlucena@vectoritcgroup.com

## License

VMRemoteConfig is available under the MIT license. See the LICENSE file for more info.