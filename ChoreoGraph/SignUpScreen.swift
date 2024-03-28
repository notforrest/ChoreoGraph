//
//  SignUpScreen.swift
//  ChoreoGraph
//
//  Created by Kathy Cui on 3/18/24.
//

import UIKit
import FirebaseAuth
class SignUpScreen: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var passwordMismatch: UILabel!
    
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        self.view.endEditing(true)

        if (!isValidEmail(username.text!)) {
            print("invalid email")
            passwordMismatch.text = "Invalid email"
   
        } else if (!isValidPassword(password.text!)) {
            print("invalid password")
            passwordMismatch.text = "Invalid password"
   
        } else if (password.text! != confirmPassword.text!) {
            print("invalid Passwords match")
            passwordMismatch.text = "Passwords do not match"
    
        }else{
            Auth.auth().createUser(withEmail: username.text!,
                                   password: password.text!) {
                authResult, error in
                if ((error as NSError?) != nil) {
                    self.passwordMismatch.text = error?.localizedDescription
                } else {
                    self.passwordMismatch.text = ""
                    self.performSegue(withIdentifier: "RegistrationSegue", sender: nil)
                }
            }
        }
        
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.text = ""
        
        password.isSecureTextEntry = true
        password.text = ""
        confirmPassword.text = ""
        confirmPassword.isSecureTextEntry = true
        
        passwordMismatch.text = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        password.text = ""
        confirmPassword.text = ""
        username.text = ""
    
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
