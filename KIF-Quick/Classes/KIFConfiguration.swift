import Quick
import KIF

/**
 KIFConfiguration enables accessibility for KIF specs
 */
class KIFConfiguration: QuickConfiguration {
    class func enableAccessibilityBeforeSpecClassSetup() {
        KIFEnableAccessibility()
    }

    override class func configure(_ configuration: Configuration) {
        enableAccessibilityBeforeSpecClassSetup()
    }
}
