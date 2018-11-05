//
//  addNewTaskViewController.swift
//  Task Manager
//
//  Created by Jamie Cummings on 10/30/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class addNewTaskViewController: UIViewController {
    
    @IBOutlet weak var newTaskName: UITextField!
    @IBOutlet weak var newTaskDetails: UITextField!
    @IBOutlet weak var newPriorityLevel: UISegmentedControl!
    @IBOutlet weak var newDueDatePicker: UIDatePicker!
    @IBOutlet weak var addNewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // this func will be called on when there are text fields left blank
    func error() {
        let errorAlert = UIAlertController(title: "ERROR", message: "Please fill out all info to add a new task.", preferredStyle: .alert)
        let closeAction = UIAlertAction(title:"Close", style: .default, handler: nil)
        errorAlert.addAction(closeAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    // this will run whe the New Button is pushed
    @IBAction func newButtonPushed(_ sender: Any) {
        guard let title = newTaskName.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let taskDescription = newTaskDetails.text,
            taskDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                error()
                //show an error and return
                return
        }
        // shows the priortiy is a variable
        var priority: String!
        
        // this will take the input selected in the segment
        switch newPriorityLevel.selectedSegmentIndex {
        case 0:
            priority = "High"
        case 1:
            priority = "Medium"
        case 2:
            priority = "Low"
        default:
            priority = "Low"
            
        }
        // default initalizer for the Task class, this will creat a Task usig the default values that were set in the Task class
        let newTask = Task()
        // setting the properties for the new task using dot notation
        newTask.title = title
        newTask.taskDescription = taskDescription
        newTask.priorityLevel = priority
        newTask.completionDate = newDueDatePicker.date
        
        TaskManager.sharedInstance.addTask(task: newTask)
        
        self.performSegue(withIdentifier: "unwindToTaskList", sender: self)
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
