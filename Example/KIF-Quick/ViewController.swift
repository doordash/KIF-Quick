import UIKit

class ViewController: UIViewController {
    @IBAction func onTap(_ sender: AnyObject) {
        if let button = sender as? UIButton {
            button.setTitle("Thank you!", for: .normal)
        }
    }
}
