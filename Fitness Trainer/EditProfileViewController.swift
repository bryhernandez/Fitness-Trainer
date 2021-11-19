//
//  EditProfileViewController.swift
//  Fitness Trainer
//
//  Created by Bryan Hernandez on 11/19/21.
//

import UIKit
import Parse

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = PFUser.current()!
        let age = user["Age"] as! Int?
        let height = user["Height"] as! Int?
        let weight = user["Weight"] as! Int?
        
        print(user.password)
        
        usernameLabel.text = user.username
//        passwordLabel.text = user.password
        ageLabel.text = String(Int(age!))
        heightLabel.text = String(Int(height!))
        weightLabel.text = String(Int(weight!))
        
    }
    
    @IBAction func onEdit(_ sender: Any) {
        
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
