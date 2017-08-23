import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var  celsiusLabel: UILabel!
    
    @IBAction func fahrenheightFieldEditingChanged(_ textField: UITextField) {
        celsiusLabel.text = textField.text
    }
}
