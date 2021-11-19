//
//  CreateScheduleViewController.swift
//  Fitness Trainer
//
//  Created by Oscar on 11/14/21.
//

import UIKit
import Parse

class CreateScheduleViewController: UIViewController {

    @IBOutlet weak var exercise: UITextField!
    @IBOutlet weak var reps: UITextField!
    @IBOutlet weak var sets: UITextField!
    @IBOutlet weak var monthText: UITextField!
    @IBOutlet weak var dayText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    
    @IBAction func creation(_ sender: Any) {
        let month = monthText.text! as String
        let day = dayText.text! as String
        let year = yearText.text! as String

        let str = month + day + year

        let date:Any = Int(str) as! Int
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
