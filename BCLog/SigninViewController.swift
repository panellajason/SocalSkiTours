//
//  LoginViewController.swift
//  BCLog
//
//  Created by Jason Panella on 6/7/20.
//  Copyright © 2020 Jason Panella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleMaps

class SigninViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField! {
        didSet {
            let placeholderText = NSAttributedString(string: "Email address",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            emailTF.attributedPlaceholder = placeholderText
        }
    }
    @IBOutlet weak var passwordTF: UITextField! {
        didSet {
            let placeholderText = NSAttributedString(string: "Password",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            passwordTF.attributedPlaceholder = placeholderText
        }
    }
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyAclakTYQKiFytFuk16Jhe_fYq2qJt7-Ko")

    }
    
    override func viewDidAppear(_ animated: Bool) {

        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "toHome", sender: self)
        }
    }
    
    @IBAction func toSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "toSignUp", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
       self.view.endEditing(true)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        
    }
    
    @IBAction func login(_ sender: UIButton) {
        self.showSpinner(onView: self.view)
        handleSignIn()
    }
    
    @objc func handleSignIn() {
        guard let email = emailTF.text else { return }
        guard let pass = passwordTF.text else { return }
        
        if !email.isEmpty && !pass.isEmpty {
            Auth.auth().signIn(withEmail: email, password: pass) { user, error in
                if error == nil && user != nil {
                    guard let userID = Auth.auth().currentUser?.uid else { return }
                    UserService.observeUserProfile(userID) { userProfile in
                        UserService.currentUserProfile = userProfile
                    }
                    self.performSegue(withIdentifier: "toHome", sender: self)
                } else {
                    self.errorLabel.text = "Error: Email or password does not exist."
                }
                self.removeSpinner()
            }
        } else {
            errorLabel.text = "Error: Fields cannot be empty."
            self.removeSpinner()
        }
    }
}








var vSpinner : UIView?
 
extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
