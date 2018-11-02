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
    
    let userName = "username"
    let password = "password"
    let newUserName = "newUser"
    let newPassword = "newPassword"
    
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
    
    @IBAction func LogInButtonTapped(_ sender: Any) {
        
        if UserNameInputTextField.text != userName {
            guard let userName = UserNameInputTextField.text, userName.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                error()
                return
            }
    
    
        }
        if PasswordTextField.text != password {
            guard let password = PasswordTextField.text, password.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                error()
                return
            }
    
        }
        
        UserNameInputTextField.text = ""
        PasswordTextField.text = ""
        self.performSegue(withIdentifier: "showMainScreen", sender: self)
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        if NewUserNameTextField.text != newUserName {
            guard let newUserName = NewUserNameTextField.text, newUserName.trimmingCharacters(in: .whitespacesAndNewlines) != "" else{
                error()
                return
            }
        }
        if NewPasswordTextField.text != newPassword {
            guard let newPassword = NewPasswordTextField.text, newPassword.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                error()
                return
            }
        }
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
