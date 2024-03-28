//
//  ViewController.swift
//  ChoreoGraph
//
//  Created by Forrest Sun on 3/8/24.
//

import UIKit
import FirebaseAuth

class LoginScreen: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func LoginButtonPressed(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: usernameTextField.text!,
                           password: passwordTextField.text!) {
            authResult, error in
            if ((error as NSError?) != nil) {
                // Handle error here
            } else {
                self.performSegue(withIdentifier: "LoginSegue", sender: self)
            }
        }
        

    }
    
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    
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
        
        usernameTextField.text = ""
        passwordTextField.isSecureTextEntry = true
        passwordTextField.text = ""

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        passwordTextField.text = ""
    
    }


    // check that email is valid
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
      
    func isValidPassword(_ password: String) -> Bool {
       return password.count >= 6
    }
    

 

}

