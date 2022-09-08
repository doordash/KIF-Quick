import Quick
import KIF_Quick

class SampleSpec: KIFSpec {
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



