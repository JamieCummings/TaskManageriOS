//
//  TaskLibraryViewController.swift
//  Task Manager
//
//  Created by Jamie Cummings on 10/31/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class TaskLibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet var taskTableView: UITableView!
    
    var currentTask: Task!
    var taskToSend: Int?
    
    // This function can be used to tell how many sections we will have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.getTaskCount()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        taskToSend = indexPath.row
        performSegue(withIdentifier: "segToDetails", sender: self)
    }
    
    // this is where we tell the table view how many cells we will have in a given section
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskViewCell") as! taskTableViewCell
        let currentTask = TaskManager.sharedInstance.getTask(at: indexPath.row)
        cell.tasktitleLabel.text = currentTask.title
        
        cell.priorityLabel.text = currentTask.priorityLevel
        
        if currentTask.complete {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
        }
        // if the task has a completion date, we want to format it into a string and display it on the due
        if let completionDate = currentTask.completionDate {
            cell.completeByDateLabel.text = formatDate(completionDate)
        } else {
            cell.completeByDateLabel.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        taskToSend = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            EditTaskViewController{
            //we need to pass through the Game that we'll be editing
            destination.taskToEdit = currentTask
            
        }
        if let destination = segue.destination as? DetailsViewController{
            destination.currentTask = taskToSend
        }
    }
    // this func allows us to return an array of actions that the row will have, if any
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_
            , _) in
            // remove the game at the current index from our game array
            TaskManager.sharedInstance.removeTask (at: indexPath.row)
            // delete the row from the table view at the current index path
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let taskforIndex = TaskManager.sharedInstance.getTask(at: indexPath.row)
        let title = taskforIndex.complete ? "Incomplete" : "Complete"
        let incompleteOrIncomplete = UITableViewRowAction(style: .normal, title: title) { (_, _) in
            TaskManager.sharedInstance.incompleteOrIncomplete(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        let showEditScreenAction = UITableViewRowAction(style: .normal, title: "Edit") { (_, _) in
            self.currentTask = TaskManager.sharedInstance.getTask(at: indexPath.row)
            self.performSegue(withIdentifier: "segToEdit", sender: self)
            
        }
        
        showEditScreenAction.backgroundColor = UIColor.blue
        
        return [deleteAction, incompleteOrIncomplete, showEditScreenAction]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //this func will get called anytime we go back to this screen so that it updates
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        taskTableView.reloadData()
    }
    
    @IBAction func unwindToTaskLibraryList(segue:
        UIStoryboardSegue) { }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
