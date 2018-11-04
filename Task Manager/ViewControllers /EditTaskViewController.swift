//
//  EditTaskViewController.swift
//  Task Manager
//
//  Created by Jamie Cummings on 10/30/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit
import RealmSwift


class EditTaskViewController: UIViewController {
    // this class all the code that will be used on the Edit Task screen
    
    var taskToEdit: Task!
    // this is a variable that is part of the Task class
    
    
    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var editDetails: UITextField!
    @IBOutlet weak var priorityLevelSegControl: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(taskToEdit.description)
        editTitle.text = taskToEdit.title
        editDetails.text = taskToEdit.taskDescription
        
        
        // taking a string and turning it into an Int
        switch taskToEdit.priorityLevel {
        case "high":
            priorityLevelSegControl.selectedSegmentIndex = 0
        case "medium":
            priorityLevelSegControl.selectedSegmentIndex = 1
        case "low":
            priorityLevelSegControl.selectedSegmentIndex = 2
        default:
            priorityLevelSegControl.selectedSegmentIndex = 2
            
        }
        
        
        
        // Do any additional setup after loading the view.
        
    }
    // this func will throw an error if any of the info hasn't been filled out.
    func error() {
        let errorAlert = UIAlertController(title: "ERROR", message: "Please fill out all info to edit the task.", preferredStyle: .alert)
        let closeAction = UIAlertAction(title:"Close", style: .default, handler: nil)
        errorAlert.addAction(closeAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    @IBAction func pushedEditButton(_ sender: UIButton) {
        // this will allow the new edits to be submitted
        guard let title = editTitle.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let taskDescription = editDetails.text,
            taskDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                error()
                //show an error and return
                return
        }
        
        
        let realm = try! Realm()
        
        try! realm.write {
            taskToEdit.title = title
            taskToEdit.taskDescription = taskDescription
            taskToEdit.completionDate = datePicker.date
            
            var priorityLevel: String!
            
            switch priorityLevelSegControl.selectedSegmentIndex {
            case 0:
                priorityLevel = "High"
            case 1:
                priorityLevel = "Medium"
            case 2:
                priorityLevel = "Low"
            default:
                priorityLevel = "Low"
                
                taskToEdit.priorityLevel = priorityLevel
            }
            
            
            
        }
        
        
        
        TaskManager.sharedInstance.editTask(task: taskToEdit)
        
        
        self.performSegue(withIdentifier: "unwindToTaskList", sender: self)
        
    }
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


