import Quick
import KIF_Quick

class SampleSpec: KIFSpec {
    override func spec() {
        describe("example app") {
            context("main view") {

                it("should have a button") {
                    viewTester().usingLabel("Tap Me").waitForView()
                }
                
                context("tap") {
                    it("should be grateful") {
                        viewTester().usingLabel("Tap Me").tap()
                        viewTester().usingLabel("Thank you!").waitForView()
                    }
                }
            }
        }
    }
}
