//
//  EditTaskViewController.swift
//  Task Manager
//
//  Created by Jamie Cummings on 10/30/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit
import RealmSwift


class EditTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var taskToEdit: Task!
    
    
    @IBAction func editDiscription(_ sender: UITextField) {
    }
    @IBAction func editTitle(_ sender: UITextField) {
    }
    
    @IBAction func priorityLevelSegControl(_ sender: UISegmentedControl) {
    }
    
    @IBAction func dueDatePicker(_ sender: UIDatePicker) {
    }
    
    @IBAction func editTaskButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(taskToEdit.description)
        editTitle.text = taskToEdit.title
        editDiscription.text = taskToEdit.taskDescription
        
        switch taskToEdit.priority {
        case "High":
            priorityLevelSegControl.selectedSegmentIndex = 0
        case "Medium":
            priorityLevelSegControl.selectedSegmentIndex = 1
        case "Low":
            priorityLevelSegControl.selectedSegmentIndex = 2
        default:
            
            priorityLevelSegControl.selectedSegmentIndex = 0
        }
    
        
        // Do any additional setup after loading the view.
        
    }
    func error() {
        let errorAlert = UIAlertController(title: "ERROR", message: "Please fill out all info to edit the task.", preferredStyle: .alert)
        let closeAction = UIAlertAction(title:"Close", style: .default, handler: nil)
        errorAlert.addAction(closeAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    @IBAction func pushedEditButton(_ sender: UIButton) {
        // this will allow the new edits to be submitted
        guard let task = editTitle.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let taskDescription = editDiscription.text,
            taskDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                error()
                //show an error and return
                return
    }
        var priority: String!
        
        switch
        priorityLevelSegContro.selectedSegmentIndex {
        case 0:
            priority = "High"
        case 1:
            priority = "Medium"
        case 2:
            priority = "Low"
        default:
            priority = "Low"
        }
        
        let realm = try! Realm()
        
        try! realm.write {
            taskToEdit.title = title
            taskToEdit.taskDescription = taskDescription
            taskToEdit.priorityLevel = priorityLevel
            //taskToEdit.genre = pickerData[editGenrePicker.selectedRow(inComponent: 0)]
        }
        
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

}
