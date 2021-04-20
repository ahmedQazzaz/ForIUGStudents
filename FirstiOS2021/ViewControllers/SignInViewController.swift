//
//  SignInViewController.swift
//  FirstiOS2021
//
//  Created by Ahmed Qazzaz on 02/04/2021.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet weak private var username : UITextField!
    @IBOutlet weak private var password : UITextField!
    
    
    @IBOutlet weak private var dateOfBirthField : UITextField!
    
    let myDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDatePicker.preferredDatePickerStyle = .wheels
        myDatePicker.addTarget(self, action: #selector(dateDidChanged(_:)), for: .valueChanged)
        myDatePicker.calendar = Calendar(identifier: .islamic)
        myDatePicker.locale = Locale(identifier: "ar")
        myDatePicker.datePickerMode = .date
        dateOfBirthField.inputView = myDatePicker
        // Do any additional setup after loading the view.
    }
    
    @objc func dateDidChanged(_ sender : UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM dd yyyy"
        formatter.locale = Locale(identifier: "ar")
        
        let Hjformatter = DateFormatter()
        Hjformatter.calendar = Calendar(identifier: .islamic)
        Hjformatter.dateFormat = "EEE, MMM dd yyyy"
        Hjformatter.locale = Locale(identifier: "ar")
        
        //http://UIDateFormatter.com
        dateOfBirthField.text = formatter.string(from: myDatePicker.date) + " <==> " + Hjformatter.string(from: myDatePicker.date)
    }
    
    
    
    
    @IBAction func submitAction(_ sender : Any?) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


//MARK:- TextField Delegate

extension SignInViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder()
//        view.endEditing(true)
        return true
    }
    
}
