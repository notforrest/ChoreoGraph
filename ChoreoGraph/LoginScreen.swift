//
//  ViewController.swift
//  ChoreoGraph
//
//  Created by Forrest Sun on 3/8/24.
//

import UIKit
import Firebase

class LoginScreen: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func LoginButtonPressed(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty,
                  let password = passwordTextField.text, !password.isEmpty else {
                // alert - add functionality later
                return
            }
        
        performSegue(withIdentifier: "LoginSegue", sender: self)
    }
    
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    
    // email authentication
//    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//        if let error = error {
//            // sign up error handling
//            print("Error signing up: \(error.localizedDescription)")
//        } else {
//            print("User signed up successfully.")
//        }
//    }
    
    // 'return' key
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // dismiss keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

