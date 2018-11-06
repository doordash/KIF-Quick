import Quick
import KIF

/**
 KIFConfiguration enables accessibility for KIF specs
 */
class KIFConfiguration: QuickConfiguration {
    /**
     tell KIF to enable accessibility for testing
     */
    class func enableAccessibilityBeforeSpecClassSetup() {
        KIFEnableAccessibility()
    }

    /**
     we have to prepare accessibility before any spec setup, 
     which might use test actors relying on accessibility
     */
    override class func configure(_ configuration: Configuration) {
        enableAccessibilityBeforeSpecClassSetup()
    }
}
