# BookMeNow

# Design
https://www.figma.com/file/tQct25XxTRIIkbyPTU2lnW/BookMe-v1?type=design&node-id=727%3A25421&mode=design&t=eBtOgRJ4RPWPOBlG-1

# API
https://bookmeservice.azurewebsites.net/swagger/index.html


# iOS Setup
## Pre-install gem tools
fastlane(https://fastlane.tools)

Getting started with fastlane for iOS
https://docs.fastlane.tools/getting-started/ios/setup/

SwiftLint(https://github.com/realm/SwiftLint)

XcodeGen(https://github.com/yonaskolb/XcodeGen)


## Fastlane plugins

Don't forgot install

[changelog](https://github.com/pajapro/fastlane-plugin-changelog)
[firebase_app_distribution](https://github.com/firebase/fastlane-plugin-firebase_app_distribution)


## Setup
Update all plugins

`fastlane update_plugins`

For creating correct ".xcodeproj" and ".xcworkspace". Please run

`fastlane xcodegen`

Also for check code and autocorrect small code style bugs, run

`fastlane lint`


## Generating .ipa file

You can run easy script

`fastlane build_ipa`
