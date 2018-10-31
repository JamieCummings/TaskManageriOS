//
//  TaskManager.swift
//  Task Manager
//
//  Created by Jamie Cummings on 10/30/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//


import Foundation
import RealmSwift
import UserNotifications

class TaskManager {
    // shared instance of the GameManager class
    static let sharedInstance = TaskManager()
    
    // we are creating a private initalizer so that no instance of this class can  be made anywhere else
    private init () {
        taskArray = realm.objects(task.self)
    }
    
    
    // Results container for storing our Games. This function very similarly to an array or dictionary.
    private var taskArray: Results<Game>
    
    //tries to create a reference to the local Realm database
    let realm = try! Realm()
    
    // function to get the number of games we have
    func getTaskCount() -> Int{
        return taskArray.count
    }
    
    // function to return a game at a specific index
    func getTask(at index: Int) -> Task{
        return taskArray[index]
    }
    
    //func to add a game to the game library
    func addTask(task: Task) {
        try! realm.write {
            realm.add(task)
        }
    }
    
    // func to remove a game from the library using the index we want to remove
    func removeTask(at index: Int){
        try! realm.write {
            realm.delete(getTask(at: index))
        }
    }
    
    //func to mark a task complete or incomplete
    func checkGameInOrOut(at index: Int) {
        
        let gameForIndex = gameArray[index]
        
        try! realm.write {
            gameForIndex.checkedIn = !gameForIndex.checkedIn
            
            if gameForIndex.checkedIn {
                // remove any existing due date
                gameForIndex.dueDate = nil
            } else{
                //add a new due date, since the game has just been checked out
                taskForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
                
                // schedule a local notification at the time of the game's due date
                let center  = UNUserNotificationCenter.current()
                
                let content = UNMutableNotificationContent()
                content.title = taskForIndex.title
                content.body = "Your task is due!"
                
                let triggerDate =
                    Calendar.current.dateComponents([.year,.month, .day, .hour, .minute, .second], from: gameForIndex.dueDate!)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                
                let identifier = taskForIndex.title
                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                
                center.add(request, withCompletionHandler: {error in if let error = error{
                    //something went wrong
                    print(error.localizedDescription)
                    }})
            }
            
        }
    }
}
