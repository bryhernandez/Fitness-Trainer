//
//  EditProfileTooViewController.swift
//  Fitness Trainer
//
//  Created by Bryan Hernandez on 11/20/21.
//

import UIKit
import Parse

class EditProfileTooViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSave(_ sender: Any) {
        let user = PFUser.current()!
        let objectId = user.objectId
        let username = usernameTextField.text
        let age:Int? = Int(ageTextField.text!)
        let height:Int? = Int(heightTextField.text!)
        let weight:Int? = Int(weightTextField.text!)
        
        if username != nil{
            user.username = username
        }
        
        if(age != nil){
            user["Age"] = age
        }
        
        if(height != nil){
            user["Height"] = height
        }
        
        if(weight != nil){
            user["Weight"] = weight
        }
        
        do{
            try! user.save()
        }catch{
            print("Error: \(error.localizedDescription)")
        }
        
         
        self.performSegue(withIdentifier: "backToEdit", sender: nil)
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
