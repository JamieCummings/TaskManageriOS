//
//  TaskLibraryViewController.swift
//  Task Manager
//
//  Created by Jamie Cummings on 10/31/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class TaskLibraryViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {

    var currentTask = Task!
    
    // This function can be used to tell how many sections we will have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.getTaskCount()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // this is where we tell the table view how many cells we will have in a given section

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell") as! gameTableViewCell
        let currentTask = TaskManager.sharedInstance.getTask(at: indexPath.row)
        //cell.titleLabel.text = currentTask.title
        //cell.ratingLabel.text = currentTask.rating
        
        if currentTask.complete {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
        }
        // if the game has a due date, we want to format it into a string and display it on the due
        if let dueDate = currentTask.dueDate { cell.completionDateLabel.text = formatDate(completionDate)
            
        } else {
            cell.completionDateLabel.text = ""
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
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
