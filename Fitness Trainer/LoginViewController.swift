//
//  LoginViewController.swift
//  Fitness Trainer
//
//  Created by Bryan Hernandez on 11/7/21.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        //TODO: Take user to main page of the app
    }
    
    @IBAction func onCreateAccount(_ sender: Any) {
        //TODO: Save to Parse database and create account
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
