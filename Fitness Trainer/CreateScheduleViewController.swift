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
    
        let month = monthText.text!
        let day = dayText.text!
        let year = yearText.text!
        let date = month + "/" + day + "/" + year
        
        let reps:Int? = Int(reps.text!)
        let sets:Int? = Int(sets.text!)
        let exercise:Int? = Int(exercise.text!)
        
        let fit = PFObject(className: "Workouts")

        fit["User"] = PFUser.current()!
        fit["Reps"] = reps
        fit["Sets"] = sets
        fit["Name"] = exercise
        fit["Date"] = date
        
        fit.saveInBackground { success, error in
        if success {
            print("Comment has been saved!")
            } else {
                print("Failed to save comment.")
            }
        }
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
