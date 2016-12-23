import Quick
//import Nimble
import KIF

public func tester(_ file: String = #file, _ line: Int = #line) -> KIFUITestActor {
    let delegate = KIFSpec.currentKIFActorDelegate
    precondition(delegate != nil, "test actor delegate should be configured")
    return KIFUITestActor(inFile: file, atLine: line, delegate: delegate)
}

public func viewTester(_ file: String = #file, _ line: Int = #line) -> KIFUIViewTestActor {
    let delegate = KIFSpec.currentKIFActorDelegate
    precondition(delegate != nil, "test actor delegate should be configured")
    return KIFUIViewTestActor(inFile: file, atLine: line, delegate: delegate)
}

public func system(_ file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
    let delegate = KIFSpec.currentKIFActorDelegate
    precondition(delegate != nil, "test actor delegate should be configured")
    return KIFSystemTestActor(inFile: file, atLine: line, delegate: delegate)
}

open class KIFSpec: QuickSpec {
    static var currentKIFActorDelegate: KIFTestActorDelegate?

    fileprivate class Prepare: KIFSpec {
        override var name: String {
            return "prepare KIF spec"
        }
    }

    override open class func setUp() {
        super.setUp()
        currentKIFActorDelegate = Prepare()
    }

    override open class func tearDown() {
        currentKIFActorDelegate = nil
        super.tearDown()
    }

    override open func fail(with exception: NSException!, stopTest stop: Bool) {
        UIView.printHierarchy()
        super.fail(with: exception, stopTest: stop)
    }

    override open func setUp() {
        super.setUp()
        continueAfterFailure = false
        KIFSpec.currentKIFActorDelegate = self
    }
}
