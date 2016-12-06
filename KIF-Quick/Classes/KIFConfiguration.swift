import Quick
import KIF

class KIFConfiguration: QuickConfiguration {
    class func enableAccessibilityBeforeSpecClassSetup() {
        KIFEnableAccessibility()
    }

    override class func configure(configuration: Configuration) {
        enableAccessibilityBeforeSpecClassSetup()
    }
}
