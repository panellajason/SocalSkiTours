//
//  SignUpViewController.swift
//  BCLog
//
//  Created by Jason Panella on 6/6/20.
//  Copyright © 2020 Jason Panella. All rights reserved.
//
import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var password2TF: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.removeSpinner()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
       self.view.endEditing(true)
    }
    
    
    @IBAction func signUp(_ sender: UIButton) {
        handleSignUp()
    }
    
    @objc func handleSignUp() {
        
        self.showSpinner(onView: self.view)

        guard let email = emailTF.text else { return }
        guard let pass = passwordTF.text else { return }
        guard let pass2 = password2TF.text else { return }

        if !email.isEmpty && !pass.isEmpty && !pass2.isEmpty {
            
            if pass == pass2 {
                Auth.auth().createUser(withEmail: email, password: pass) { user, error in
                    if error == nil && user != nil {
                        guard let userID = Auth.auth().currentUser?.uid else { return }
                        UserService.currentUserProfile = User(userID: userID, favoriteTours: [])
                        self.performSegue(withIdentifier: "toHome2", sender: self)
                        
                    } else {
                        print("Error: \(error!.localizedDescription)")
                        self.errorLabel.text = "Error: " + error!.localizedDescription
                        self.removeSpinner()
                    }
                }
            } else {
                errorLabel.text = "Error: Passwords must match."
                self.removeSpinner()
            }
        }
        else {
            errorLabel.text = "Error: Fields cannot be empty."
            self.removeSpinner()
        }
        
    }
}

