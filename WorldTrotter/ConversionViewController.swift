import UIKit

//View controller responsible for converting temperature between F and C.
class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    //Interface Builder Outlets
    @IBOutlet var celsiusLabel: UILabel!    //Outlet to UILabel
    @IBOutlet var textField: UITextField!   //Outlet to UIText field
    
    //Farenheit value of temperature
    var fahrenheitValue: Measurement<UnitTemperature>? {
        //property observer that monitors change in fahrenheit value
        didSet {
            updateCelsiusLabel()
        }
    }
    
    //Celsius value equivalent of farenheit value. Nil is no farenheit value.
    var celsuisValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    //number formatter closure
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    //Set initial value
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
        
        updateCelsiusLabel()
    }
    
    //Interface Builder action function that handles when the textField UITextField contains input
    @IBAction func fahrenheightFieldEditingChanged(_ textField: UITextField) {
        
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    //Interface Builder action function that dismisses the keyboard when the background view is tapped
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder();
    }
    
    //Function to update the celsius label
    func updateCelsiusLabel() {
        if let celsuisValue = celsuisValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsuisValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    //Delegate function that allows for only one decimal place in the temperature input
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool  {
        
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
}
