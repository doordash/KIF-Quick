import UIKit

class ViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func onTap(_ button: UIButton) {
        guard let text = textField.text, !text.isEmpty else {
            button.setTitle("Tap Me", for: .normal)
            return
        }
        button.setTitle(text, for: .normal)
    }
}
