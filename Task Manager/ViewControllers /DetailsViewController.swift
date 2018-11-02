//
//  DetailsViewController.swift
//  Task Manager
//
//  Created by Jamie Cummings on 11/2/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var DetailsLabel: UILabel!
    
    var currentTask: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(Task.description)
        DetailsLabel.text! = TaskManager.sharedInstance.getTask(at: currentTask!).taskDescription
        
        
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
