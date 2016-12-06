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
                
                context("tap") {
                    it("should change title") {
                        viewTester().usingLabel("Tap Me").tap()
                        viewTester().usingLabel("Thank you!").waitForView()
                    }
                }
            }
        }
    }
}
