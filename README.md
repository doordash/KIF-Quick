# KIF-Quick
Enable Behaviour-Driven Integration Tests built on KIF using Quick syntax, supports Xcode 8.1

[![Swift][swift-badge]][swift-url]
[![Travis][travis-badge]][travis-url]
[![Version][version-badge]][pod-url]
[![Platform][platform-badge]][pod-url]
[![License][mit-badge]][pod-url]

## Installation

KIF-Quick is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KIF-Quick'
```

## Usage
`import KIF_Quick` in your specs and start writing KIF tests using Quick describe/context and it blocks.  See the [SampleSpec.m](https://github.com/doordash/KIF-Quick/blob/master/Example/Tests/SampleSpec.swift) example:
```Swift
import Quick
import KIF_Quick

class MainViewSpec: KIFSpec {
    override func spec() {
        describe("example app") {
            context("main view") {
                context("tap") {
                    it("should change to Thank you") {
                        viewTester().usingLabel("Tap Me").tap()
                        viewTester().usingLabel("Thank you!").waitForView()
                    }
                }
            }
        }
    }
}
```

## Example

To run the sample spec in example project, clone the repo, and run `pod install` from the Example directory first.


## Author

[Paul Zabelin](https://github.com/paulz)

## License

KIF-Quick is available under the MIT license. See the LICENSE file for more info.

[swift-badge]: https://img.shields.io/badge/Swift-2.3-orange.svg?style=flat
[swift-url]: https://swift.org
[travis-badge]: http://img.shields.io/travis/doordash/KIF-Quick.svg?style=flat
[travis-url]: https://travis-ci.org/doordash/KIF-Quick
[version-badge]: https://img.shields.io/cocoapods/v/KIF-Quick.svg?style=flat
[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[platform-badge]: https://img.shields.io/cocoapods/p/KIF-Quick.svg?style=flat
[pod-url]: http://cocoapods.org/pods/KIF-Quick
