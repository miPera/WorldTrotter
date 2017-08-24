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
    
    //Set initial value
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCelsiusLabel()
    }
    
    @IBAction func fahrenheightFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
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
