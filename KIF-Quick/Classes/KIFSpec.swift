import Quick
import KIF

/**
 creates KIFUITestActor for a KIFSpec
 */
public func tester(file: String = #file, _ line: Int = #line) -> KIFUITestActor {
    return KIFUITestActor(inFile: file, atLine: line, delegate: KIFSpec.getCurrentKIFActorDelegate())
}

/**
 creates KIFUIViewTestActor for a KIFSpec
 */
public func viewTester(file: String = #file, _ line: Int = #line) -> KIFUIViewTestActor {
    return KIFUIViewTestActor(inFile: file, atLine: line, delegate: KIFSpec.getCurrentKIFActorDelegate())
}

/**
 creates KIFSystemTestActor for a KIFSpec
 */
public func system(file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
    return KIFSystemTestActor(inFile: file, atLine: line, delegate: KIFSpec.getCurrentKIFActorDelegate())
}

/**
 KIFSpec is a base class all KIF specs written in Quick inherit from.
 They need to inherit from KIFSpec, a subclass of QuickSpec, in
 order to be discovered by the XCTest framework.

 KIFSpec passes the KIF actor failure to Quick to be reported
 */

open class KIFSpec: QuickSpec {
    private static var currentKIFActorDelegate: KIFTestActorDelegate?

    private class Prepare: KIFSpec {
        override var name: String {
            return "prepare KIF spec"
        }
    }

    /**
     returns current QuickSpec as KIFTestActorDelegate
     */
    fileprivate class func getCurrentKIFActorDelegate() -> KIFTestActorDelegate {
        let delegate = KIFSpec.currentKIFActorDelegate
        precondition(delegate != nil, "Test actor delegate should be configured. " +
            "Did you attempt to use a KIFTestActor outside of a test?")
        return delegate!
    }

    override open class func setUp() {
        super.setUp()
        currentKIFActorDelegate = Prepare()
    }

    override open class func tearDown() {
        currentKIFActorDelegate = nil
        super.tearDown()
    }

    override open func setUp() {
        super.setUp()
        continueAfterFailure = false
        KIFSpec.currentKIFActorDelegate = self
    }
}
