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
import BLTNBoard

class SignUpViewController: UIViewController, UINavigationControllerDelegate {

    var isNewUser = false
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
    @IBOutlet weak var password2TF: UITextField! {
        didSet {
            let placeholderText = NSAttributedString(string: "Confirm Password",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            password2TF.attributedPlaceholder = placeholderText
        }
    }
    @IBOutlet weak var errorLabel: UILabel!
    private lazy var disclaimerBoardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "Disclaimer")
        item.descriptionText = "WARNING: Skiing and snowboarding are dangerous sports that can result in death, paralysis, or serious injury. Please take all precautions and use your own ability, evaluation, and judgement to assess the risks of your terrain choice on a particular day, rather than relying on the information in this app. It is imperative that you own, carry, and know how to use an avalanche beacon, shovel, and probe when skiing in the backcountry. The user assumes all risk associated with the use of this app and with the activities of skiing and snowboarding."
        item.actionButtonTitle = "Ok"
        item.appearance.actionButtonColor = .systemBlue
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
        }
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var aboutBoardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "About")
        item.descriptionText = ""
        return BLTNItemManager(rootItem: item)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openAbout(_ sender: Any) {
        aboutBoardManager.showBulletin(above: self)
    }
    
    @IBAction func openDisclaimer(_ sender: Any) {
        disclaimerBoardManager.showBulletin(above: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
       self.view.endEditing(true)
    }
    
    @IBAction func closeView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
                        self.isNewUser = true
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toHome2") {
            let tabCtrl: UITabBarController = segue.destination as! UITabBarController
            let viewController = tabCtrl.viewControllers![0] as! UINavigationController
            let vc = viewController.viewControllers[0] as! HomeViewController
            vc.isNewUser = isNewUser
        }
    }
}

