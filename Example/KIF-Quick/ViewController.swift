import UIKit

class ViewController: UIViewController {
    @IBAction func onTap(button: UIButton) {
        button.setTitle("Thank you!", forState: .Normal)
    }
}
