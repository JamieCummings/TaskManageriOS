//
//  addNewTaskViewController.swift
//  Task Manager
//
//  Created by Jamie Cummings on 10/30/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class addNewTaskViewController: UIViewController {
    
    // this func shows how many componets the view needs
    //func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //return 1
    //}
    // func shows how many rows are needed on the view
   // func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return pickerData.count
    //}
    // func gives the title for the row
    //func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return pickerData[row]
   // }
    
    // these are the genres that the picker will use
    //var pickerData: [String] = ["Massively Multiplayer Online", "Simulations", "Adventure", "Real-Time Strategy","Puzzle", "Action", "Stealth Shooter", "Combat","First Person Shooters","Sports","Role-Playing","Educational"]

    
    @IBOutlet weak var newTaskName: UITextField!
    
    @IBOutlet weak var newTaskDetails: UITextField!
    
    @IBOutlet weak var newPriorityLevel: UISegmentedControl!
    
    @IBOutlet weak var newDueDatePicker: UIDatePicker!
    
    @IBOutlet weak var addNewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func error() {
        let errorAlert = UIAlertController(title: "ERROR", message: "Please fill out all info to add a new task.", preferredStyle: .alert)
        let closeAction = UIAlertAction(title:"Close", style: .default, handler: nil)
        errorAlert.addAction(closeAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    @IBAction func newButtonPushed(_ sender: Any) {
        guard let title = newTaskName.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let taskDescription = newTaskDetails.text,
            taskDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                error()
                //show an error and return
                return
    }
        var priority: String!
        
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
        
        let newTask = Task()
        
        newTask.title = title
        newTask.taskDescription = taskDescription
        newTask.priorityLevel = priority
        
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
