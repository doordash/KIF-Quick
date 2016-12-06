import Quick
import Nimble
import KIF_Quick

class SampleSpec: KIFSpec {
    override func spec() {
        describe("example app") {
            context("main view") {

                it("should have a button") {
                    viewTester().usingLabel("Tap Me").waitForView()
                }

                it("will eventually pass") {
                    var time = "passing"

                    dispatch_async(dispatch_get_main_queue()) {
                        time = "done"
                    }

                    waitUntil { done in
                        NSThread.sleepForTimeInterval(0.5)
                        expect(time) == "done"

                        done()
                    }
                }
            }
        }
    }
}
