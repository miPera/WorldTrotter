import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var  celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        //property observer that monitors change in fahrenheit value
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsuisValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    @IBAction func fahrenheightFieldEditingChanged(_ textField: UITextField) {
        
        //text field has text and text is not empty
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder();
    }
    
    func updateCelsiusLabel() {
        if let celsuisValue = celsuisValue {
            celsiusLabel.text = "\(celsuisValue.value)"
        } else {
            celsiusLabel.text = "???"
        }
    }
}
