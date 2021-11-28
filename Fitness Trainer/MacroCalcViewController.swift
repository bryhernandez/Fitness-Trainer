//
//  MacroCalcViewController.swift
//  Fitness Trainer
//
//  Created by Bryan Hernandez on 11/14/21.
//

import UIKit
import Parse

//These are the activity levels based on users activity level
let sedentary = 1.2
let lightly = 1.37
let moderate = 1.55
let very = 1.72
let extreme = 1.9

//mifflin aquation to solve for male and female bmr
func mifflin_equation_female(kg: Double, cm: Double, age: Double) -> Double{
     let bmr = (9.99 * kg) + (6.25 * cm) - (4.92 * age) - 161;
    
    return bmr;
}

func mifflin_equation_male(kg: Double, cm: Double, age: Double) -> Double {
     let bmr = (9.99 * kg) + (6.25 * cm) - (4.92 * age) + 5;
    
    return bmr;
}

//calculates maintanence calories given user bmr and activty level
func calc_cals(activity: Int, bmr: Int) -> Int{
    if activity == 1{
        return Int(Double(bmr) * sedentary)
    } else if activity == 2 {
        return Int(Double(bmr) * lightly)
    } else if activity == 3{
        return Int(Double(bmr) * moderate)
    } else if activity == 4 {
        return Int(Double(bmr) * very)
    } else if activity == 5 {
        return Int(Double(bmr) * extreme)
    }
    
    return 1
      
}

func calc_fat(fat: Double, total_cals: Int) -> Int{
    var fat_macros = fat*Double(total_cals)
    fat_macros = fat_macros/9

    return Int(fat_macros)
}

func calc_fat_cals(fat: Double, total_cals: Int) -> Int{
    return Int(fat*Double(total_cals))
}

class MacroCalcViewController: UIViewController {

    @IBOutlet weak var activityControl: UISegmentedControl!
    @IBOutlet weak var maintanenceCalsLabel: UILabel!
    @IBOutlet weak var addOrSubtractTextField: UITextField!
    @IBOutlet weak var plusOrMinusControl: UISegmentedControl!
    @IBOutlet weak var proteinControl: UISegmentedControl!
    @IBOutlet weak var fatControl: UISegmentedControl!
    @IBOutlet weak var proteinTextField: UILabel!
    @IBOutlet weak var fatTextField: UILabel!
    @IBOutlet weak var carbsTextField: UILabel!
    @IBOutlet weak var totalCaloriesTextField: UILabel!
    
    
    var maintanence_cals = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onActivitySelect(_ sender: Any) {
        let user = PFUser.current()! //gets the user that is currently logged in
        
        var bmr = 0.0 //body metabolic rate
        let age = user["Age"] as! Double?
        let gender = user["Sex"] as! String?
        let inch = user["Height"] as! Double?
        let lbs = user["Weight"] as! Double?
        
        let kg = Double(lbs!)/2.20462 //converts user weight, which is in lbs, to kg
        let cm = Double(inch!)*2.54 //converts user height, which is inches, to cm
        
        
        if(gender?.lowercased() == "male"){
            bmr = mifflin_equation_male(kg: kg, cm: cm, age: age!)
        } else if(gender?.lowercased() == "female"){
            bmr = mifflin_equation_female(kg: kg, cm: cm, age: age!)
        }
        
        let activityC = [1, 2, 3, 4, 5]
        let activity = activityC[activityControl.selectedSegmentIndex]
        
        maintanence_cals = calc_cals(activity: activity, bmr: Int(bmr))
        
        maintanenceCalsLabel.text = String(format: "%.0f", Double(maintanence_cals))
    }
    
    @IBAction func onSave(_ sender: Any) {
        let user = PFUser.current()!
        
        var plus_minus = Int(addOrSubtractTextField.text!) ?? 0 //takes user input for how many calories they want to cut or bulk
        let plus_minus_val = [1, 2]
        let vals = plus_minus_val[plusOrMinusControl.selectedSegmentIndex]
        if vals == 2{
            plus_minus = -1*plus_minus
        }
        let total_cals = maintanence_cals+plus_minus
        let lbs = (user["Weight"] as! Double?)!
        
        let protein_vals = [0.8, 0.9, 1.0, 1.1, 1.2]
        let protein = protein_vals[proteinControl.selectedSegmentIndex]
        let total_protein = protein*lbs
        
        let fat_vals = [0.2, 0.22, 0.24, 0.26, 0.28, 0.30]
        let fat = fat_vals[fatControl.selectedSegmentIndex]
        let total_fat = calc_fat(fat: fat, total_cals: total_cals)
        print("fat: ", total_fat)
        
        let carbs = (total_cals) - ((Int(total_protein)*4) + calc_fat_cals(fat: fat, total_cals: total_cals))
        let total_carbs = carbs/4
        print("carbs: ", total_carbs)
        
        proteinTextField.text = String("\(total_protein) g")
        fatTextField.text = String("\(total_fat) g")
        carbsTextField.text = String("\(total_carbs) g")
        totalCaloriesTextField.text = String(total_cals)
        
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
