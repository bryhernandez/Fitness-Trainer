//
//  ViewScheduleTableViewController.swift
//  Fitness Trainer
//
//  Created by Bryan Hernandez on 11/23/21.
//

import UIKit
import Parse

class ViewScheduleTableViewController: UITableViewController {
    
    var plan = [PFObject]()
    var size:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewScheduleCell", for: indexPath) as! ViewScheduleCell
        let user = PFUser.current()!
        let the_plan = plan[indexPath.row]
        let id = user.username as! String?
        let query = PFQuery(className:"Workouts")
        
        let sets = the_plan["Sets"] as! Int?
        let reps = the_plan["Reps"] as! Int?
        cell.dateLabel.text = the_plan["Date"] as? String
        cell.workoutLabel.text = the_plan["Name"] as? String
        cell.setsLabel.text = String(Int(sets!))
        cell.repsLabel.text = String(Int(reps!))
        
        query.whereKey("username", equalTo: id)
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            }
            else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) workouts with the user.")
            
                // Do something with the found objects
            
            }
        }
        return cell
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return plan.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let user = PFUser.current()!
        let id = user.username as! String?
        let query = PFQuery(className:"Workouts")
        query.whereKey("username", equalTo: id)
        query.findObjectsInBackground { (workouts, error) in
            if workouts != nil{
                self.plan = workouts!
                self.tableView.reloadData()
            }
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
