//
//  ForgotPassViewController.swift
//  BCLog
//
//  Created by Jason Panella on 7/25/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import BLTNBoard


class ForgotPassViewController: UIViewController {

    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var emailTF: UITextField! {
        didSet {
            let placeholderText = NSAttributedString(string: "Email address",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            emailTF.attributedPlaceholder = placeholderText
        }
    }
    private lazy var successBoardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "Success!")
        item.descriptionText = "Check your email for more information."
        item.actionButtonTitle = "Ok"
        item.appearance.actionButtonColor = .systemBlue
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
        }
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var invalidBoardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "Invalid entry.")
        item.descriptionText = "There is no user corresponding to this email address."
        item.actionButtonTitle = "Ok"
        item.appearance.actionButtonColor = .systemBlue
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
        }
        return BLTNItemManager(rootItem: item)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.smallView.layer.borderWidth = 1
        self.smallView.layer.borderColor = UIColor.white.cgColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
       self.view.endEditing(true)
    }
    
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func sendPasswordRecoveryEmail(_ sender: Any) {
        self.showSpinner(onView: self.view)
        guard let email = emailTF.text else { return }
        if !email.isEmpty {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if error == nil {
                    self.successBoardManager.showBulletin(above: self)
                } else {
                    self.invalidBoardManager.showBulletin(above: self)
                }
                self.removeSpinner()
            }
        } else {
            self.removeSpinner()
        }
    }
}
