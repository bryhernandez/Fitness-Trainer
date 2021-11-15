//
//  HomePageViewController.swift
//  Fitness Trainer
//
//  Created by Bryan Hernandez on 11/11/21.
//

import UIKit
import Parse

class HomePageViewController: UIViewController {

    @IBOutlet weak var macrosButton: UIButton!
    
    @IBOutlet weak var createPlan: UIButton!
    
    
    @IBOutlet weak var ringTone: UIButton!
    
    @IBOutlet weak var viewPlan: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginViewController
        
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
