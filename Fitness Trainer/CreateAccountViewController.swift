//
//  CreateAccountViewController.swift
//  Fitness Trainer
//
//  Created by Bryan Hernandez on 11/13/21.
//

import UIKit
import Parse

class CreateAccountViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let toolBar = UIToolbar() //this adds a toolbar to the keyboards to allow users to exit the keyboard
        toolBar.sizeToFit()
        
        let doneButton =  UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([doneButton], animated: false)
        
        usernameTextField.inputAccessoryView = toolBar
        passwordTextField.inputAccessoryView = toolBar
        ageTextField.inputAccessoryView = toolBar
        sexTextField.inputAccessoryView = toolBar
        heightTextField.inputAccessoryView = toolBar
        weightTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }
    

    @IBAction func onSignUp(_ sender: Any) {
        //TODO: Save all information into parse database.
        let sex = sexTextField.text
        let age:Int? = Int(ageTextField.text!)
        let height:Int? = Int(heightTextField.text!)
        let weight:Int? = Int(weightTextField.text!)
        
        //checks to make sure that no values are empty when signing up
        if sex != nil && age != nil && height != nil && weight != nil {
            let user = PFUser()
            user.username = usernameTextField.text
            user.password = passwordTextField.text
            user["Sex"] = sex
            user["Age"] = age
            user["Height"] = height
            user["Weight"] = weight

            user.signUpInBackground { (success, error) in
                if success{
                    self.performSegue(withIdentifier: "successfulSignupSegue", sender: nil)
                } else {
                    print("Error: \(error?.localizedDescription)")
                }
            }
        }
        
        //if any values are missing, then message prints in the console
        if sex == nil || age == nil || height == nil || weight == nil{
            print("Cannot leave any values empty.")
        }
        
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
