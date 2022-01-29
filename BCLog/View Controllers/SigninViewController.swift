//
//  LoginViewController.swift
//  BCLog
//
//  Created by Jason Panella on 6/7/20.
//  Copyright © 2020 Jason Panella. All rights reserved.
//

import UIKit
import FirebaseAuth
import BLTNBoard

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
    @IBOutlet weak var imageView: UIImageView!
    
    private lazy var disclaimerBoardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "Disclaimer")
        item.appearance.titleTextColor = .red
        item.descriptionText = "WARNING: Skiing and snowboarding are dangerous sports that can result in death, paralysis, or serious injury. Please take all precautions and use your own ability, evaluation, and judgement to assess the risks of your terrain choice on a particular day, rather than relying on the information in this app. It is imperative that you own, carry, and know how to use an avalanche beacon, shovel, and probe when skiing in the backcountry, as well as crampons and ice axe. The user assumes all risk associated with the use of this app and with the activities of skiing and snowboarding."
        item.actionButtonTitle = "Ok"
        item.appearance.actionButtonColor = .systemBlue
        item.actionHandler = { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }
        return BLTNItemManager(rootItem: item)
    }()
    
    private lazy var aboutBoardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "About")
        item.appearance.titleTextColor = .systemBlue
        item.descriptionText = "Known for its beaches and sunny weather, Southern California doesn't usually come to mind as a backcountry skiing destination. When winter does decide to show its face, the alpine terrain comes to life and so do the dedicated backcountry riders. This app covers some of the major ski descents in Southern California and can serve alongside one of the many tools needed for planning a backcountry ski tour."
        item.actionButtonTitle = "Ok"
        item.appearance.actionButtonColor = .systemBlue
        item.actionHandler = { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }
        return BLTNItemManager(rootItem: item)
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (UIScreen.main.bounds.width > 375.0) {
            imageView.frame.size.height = 500.0
        }
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "toHome", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        errorLabel.text = ""
        emailTF.text = ""
        passwordTF.text = ""
        self.view.endEditing(true)
        UIView.setAnimationsEnabled(false)
    }
    
    @IBAction func openAbout(_ sender: Any) {
        aboutBoardManager.showBulletin(above: self)
    }
    
    @IBAction func openDisclaimer(_ sender: Any) {
        disclaimerBoardManager.showBulletin(above: self)
    }
    
    @IBAction func toSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "toSignUp", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
       self.view.endEditing(true)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        self.performSegue(withIdentifier: "toForgotPassword", sender: self)
    }
    
    @IBAction func login(_ sender: UIButton) {
        errorLabel.text = ""

        guard let email = emailTF.text else { return }
        guard let password = passwordTF.text else { return }

        if !email.isEmpty && !password.isEmpty {
            self.showSpinner(onView: self.view)

            DatabaseService.handleSignIn(email: email, password: password) { [weak self] error in
                
                guard error == nil else {
                    
                    self?.errorLabel.text = ValidationError.invalidCredentials.localizedDescription
                    self?.removeSpinner()
                    return
                }
                
                self?.performSegue(withIdentifier: "toHome", sender: self)
            }
        } else {
            errorLabel.text = ValidationError.emptyTextFields.localizedDescription
        }
    }
}


