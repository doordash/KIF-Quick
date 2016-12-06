import UIKit

class ViewController: UIViewController {
    @IBAction func onTap(sender: AnyObject) {
        if let button = sender as? UIButton {
            button.setTitle("Thank you!", forState: .Normal)
        }
    }
}
