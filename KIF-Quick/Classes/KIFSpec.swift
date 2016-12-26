import Quick
import KIF

public func tester(file: String = #file, _ line: Int = #line) -> KIFUITestActor {
    let delegate = KIFSpec.currentKIFActorDelegate
    precondition(delegate != nil, "test actor delegate should be configured")
    return KIFUITestActor(inFile: file, atLine: line, delegate: delegate)
}

public func viewTester(file: String = #file, _ line: Int = #line) -> KIFUIViewTestActor {
    let delegate = KIFSpec.currentKIFActorDelegate
    precondition(delegate != nil, "test actor delegate should be configured")
    return KIFUIViewTestActor(inFile: file, atLine: line, delegate: delegate)
}

public func system(file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
    let delegate = KIFSpec.currentKIFActorDelegate
    precondition(delegate != nil, "test actor delegate should be configured")
    return KIFSystemTestActor(inFile: file, atLine: line, delegate: delegate)
}

public class KIFSpec: QuickSpec {
    static var currentKIFActorDelegate: KIFTestActorDelegate?

    private class Prepare: KIFSpec {
        override var name: String {
            return "prepare KIF spec"
        }
    }

    override public class func setUp() {
        super.setUp()
        currentKIFActorDelegate = Prepare()
    }

    override public class func tearDown() {
        currentKIFActorDelegate = nil
        super.tearDown()
    }

    override public func failWithException(exception: NSException!, stopTest stop: Bool) {
        UIView.printViewHierarchy()
        super.failWithException(exception, stopTest: stop)
    }

    override public func setUp() {
        super.setUp()
        continueAfterFailure = false
        KIFSpec.currentKIFActorDelegate = self
    }
}
