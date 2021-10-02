//
//  SignUpViewController.swift
//  BCLog
//
//  Created by Jason Panella on 6/6/20.
//  Copyright © 2020 Jason Panella. All rights reserved.
//
import UIKit
import BLTNBoard

class SignUpViewController: UIViewController, UINavigationControllerDelegate {

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
        item.appearance.titleTextColor = .systemRed
        item.descriptionText = "WARNING: Skiing and snowboarding are dangerous sports that can result in death, paralysis, or serious injury. Please take all precautions and use your own ability, evaluation, and judgement to assess the risks of your terrain choice on a particular day, rather than relying on the information in this app. It is imperative that you own, carry, and know how to use an avalanche beacon, shovel, and probe when skiing in the backcountry. The user assumes all risk associated with the use of this app and with the activities of skiing and snowboarding."
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
        item.descriptionText = "Known for its beaches and sunny weather, Southern California doesn't usually come to mind as a backcountry skiing destination. When winter does decide to show its face, the alpine terrain comes to life and so do the dedicated backcountry riders. This app can serve as a starting point for getting to know the area and what it has in store for human-powered skiing."
        item.actionButtonTitle = "Ok"
        item.appearance.actionButtonColor = .systemBlue
        item.actionHandler = { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }
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
    
    @IBAction func signUp(_ sender: UIButton) {
        
        errorLabel.text = ""
        guard let email = emailTF.text else { return }
        guard let password1 = passwordTF.text else { return }
        guard let password2 = password2TF.text else { return }

        if !email.isEmpty && !password1.isEmpty && !password2.isEmpty {
            if password1 == password2 {
                self.showSpinner(onView: self.view)
                
                DatabaseService.handleSignUp(email: email, password: password1) { [weak self] error in
                    
                    guard error == nil else {
                        
                        self?.errorLabel.text = error?.localizedDescription
                        self?.removeSpinner()
                        return
                    }
                    
                    self?.performSegue(withIdentifier: "toHome2", sender: self)
                }
            } else {
                errorLabel.text = ValidationError.passwordsMustMatch.localizedDescription
            }
            
        } else {
            errorLabel.text = ValidationError.emptyTextFields.localizedDescription
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toHome2") {
            let tabCtrl: UITabBarController = segue.destination as! UITabBarController
            let viewController = tabCtrl.viewControllers![0] as! UINavigationController
            let vc = viewController.viewControllers[0] as! HomeViewController
            vc.isNewUser = true
        }
    }
}

