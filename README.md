# KIF-Quick
Write [KIF](https://github.com/kif-framework/KIF) tests [Quick](https://github.com/Quick/Quick) style in Swift!

KIF-Quick is a bridge between the Keep It Functional and Quick frameworks. It allows you to perform KIF actions using Quick syntax.

[![Swift][swift-badge]][swift-url]
[![Travis][travis-badge]][travis-url]
[![Version][version-badge]][pod-url]
[![Platform][platform-badge]][pod-url]
[![License][mit-badge]][pod-url]

## Installation

KIF-Quick is available through [CocoaPods](http://cocoapods.org). To install it, simply add `pod 'KIF-Quick'` to your test target in Podfile:

```ruby
target 'Your App' do
  ...
end

target 'Acceptance Tests' do
  pod 'KIF-Quick'
end
```
this will also install KIF and Quick frameworks as dependencies ensuring compatible versions.

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
