//
//  LogInViewController.swift
//  Task Manager
//
//  Created by Jamie Cummings on 11/1/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var UserNameInputTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var NewUserNameTextField: UITextField!
    
    @IBOutlet weak var NewPasswordTextField: UITextField!
    
    let username = "username"
    let password = "password"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func LogInButtonTapped(_ sender: Any) {
        
        if UserNameInputTextField.text != username {
            //Show an error
        }
        if PasswordTextField.text != password {
            //Show an error
        }
        
        UserNameInputTextField.text = ""
        PasswordTextField.text = ""
        self.performSegue(withIdentifier: "showMainScreen", sender: self)
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        NewUserNameTextField.text = ""
        NewPasswordTextField.text = ""
        self.performSegue(withIdentifier: "showMainScreen", sender: self)
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
