# KIF-Quick
Write [KIF](https://github.com/kif-framework/KIF) tests [Quick](https://github.com/Quick/Quick) style in Swift!

KIF-Quick is a bridge between the Keep It Functional and Quick frameworks. It allows you to perform KIF actions using Quick syntax. See [wiki/Why-KIF-Quick](https://github.com/doordash/KIF-Quick/wiki/Why-KIF-Quick)

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
                it("should have necessary views") {
                    viewTester().usingLabel("Tap Me").waitForView()
                    viewTester().usingLabel("text_field").waitForView()
                }
                context("inject data to view") {
                    it("should allow data injection") {
                        viewTester().usingLabel("text_field").replaceText("Test Message")
                    }
                }
                context("tap") {
                    it("should be grateful") {
                        viewTester().usingLabel("Tap Me").tap()
                        viewTester().usingLabel("Test Message").waitForView()
                    }
                }
            }
        }
    }
}
```

## Example

To run the sample spec in example project, clone the repo, and open Example workspace:
```
open Example/KIF-Quick.xcworkspace
```
Select simulator and run tests as usual by pressing <kbd>Command</kbd> + <kbd>U</kbd>

### Command Line
Run tests using xcodebuild:
```
xcodebuild -workspace Example/KIF-Quick.xcworkspace -scheme KIF-Quick-Example -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 7,OS=10.2' ONLY_ACTIVE_ARCH=NO test
```
This is how [Travis][travis-url] runs them to keep us honest, see [.travis.yml](https://github.com/doordash/KIF-Quick/blob/master/.travis.yml)

And you should see test output similar to this
```
▸ Test Succeeded
All tests
Test Suite KIF-Quick_Tests.xctest started
SampleSpec
    ✓ example_app__main_view__should_have_a_button (0.003 seconds)
    ✓ example_app__main_view__tap__should_be_grateful (0.581 seconds)
     Executed 2 tests, with 0 failures (0 unexpected) in 0.584 (0.586) seconds
```
where nested Quick contexts concatenated to give full KIF test name. This allows to pinpoint location of possible failures when they happen and have readable English like sentenses describing the functionality.

## Swift Version

If your project is still using Swift 2 you can can use previous version of KIF-Quick. Use the table below to determine which versions of KIF-Quick are compatible with your project.

|Swift version        |KIF-Quick version|`Podfile` usage|git branch|
|:--------------------|:---------------|:---------------|:---------------|
|Swift 3              |v1.1.0 or later |`pod 'KIF-Quick'`|master|
|Swift 2.2 / Swift 2.3|v1.0.1 or later |`pod 'KIF-Quick', '~> 1.0.0'`|swift2.3|

or you can specify this branch in your Podfile:
```
  pod 'KIF-Quick', :git => 'https://github.com/doordash/KIF-Quick.git', :branch => 'swift2.3'
```

## Contributors

| [<img src="https://avatars.githubusercontent.com/u/2940471?v=3&s=100" width="100px;"/><br /><sub>Ian Luo</sub>](https://github.com/lokae0)<br />[💻](https://github.com/doordash/KIF-Quick/commits?author=lokae0) |
| :---: |

This project follows the [all-contributors][all-contributors] specification.
Contributions of any kind welcome!

https://github.com/doordash/KIF-Quick/graphs/contributors

## Author

[Paul Zabelin](https://github.com/paulz)


## License

KIF-Quick is available under the MIT license. See the LICENSE file for more info.

[swift-badge]: https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat
[swift-url]: https://swift.org
[travis-badge]: http://img.shields.io/travis/doordash/KIF-Quick.svg?style=flat
[travis-url]: https://travis-ci.org/doordash/KIF-Quick
[version-badge]: https://img.shields.io/cocoapods/v/KIF-Quick.svg?style=flat
[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[platform-badge]: https://img.shields.io/cocoapods/p/KIF-Quick.svg?style=flat
[pod-url]: http://cocoapods.org/pods/KIF-Quick
[all-contributors]: https://github.com/kentcdodds/all-contributors
