//
//  EditTaskViewController.swift
//  Task Manager
//
//  Created by Jamie Cummings on 10/30/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit



class EditTaskViewController: UIViewController {
    
    var taskToEdit: Task!
    
    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var editDetails: UITextField!
    @IBOutlet weak var priorityLevelSegControl: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editTitle.text = taskToEdit.title
        editDetails.text = taskToEdit.taskDescription
        
        
        
        
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
        guard let title = editTitle.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let taskDescription = editDetails.text,
            taskDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                error()
                //show an error and return
                return
        }
        var priority: String!
        
        switch
        priorityLevelSegControl.selectedSegmentIndex {
        case 0:
            priority = "High"
        case 1:
            priority = "Medium"
        case 2:
            priority = "Low"
        default:
            priority = "Low"
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


