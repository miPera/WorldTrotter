import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var  celsiusLabel: UILabel!
    
    @IBAction func fahrenheightFieldEditingChanged(_ textField: UITextField) {
        
        //text field has text and text is not empty
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
    }
}
