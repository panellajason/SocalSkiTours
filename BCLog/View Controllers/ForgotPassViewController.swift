//
//  ForgotPassViewController.swift
//  BCLog
//
//  Created by Jason Panella on 7/25/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import BLTNBoard

class ForgotPassViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField! {
        didSet {
            let placeholderText = NSAttributedString(string: "Email address",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            emailTF.attributedPlaceholder = placeholderText
        }
    }
    private lazy var successBoardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "Success!")
        item.appearance.titleTextColor = .green
        item.descriptionText = "Check your email for more information."
        item.actionButtonTitle = "Ok"
        item.appearance.actionButtonColor = .systemBlue
        item.actionHandler = { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)

        }
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var invalidBoardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "Invalid entry.")
        item.appearance.titleTextColor = .red
        item.descriptionText = "There is no user corresponding to this email address."
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
       self.view.endEditing(true)
    }
    
    @IBAction func sendPasswordRecoveryEmail(_ sender: Any) {
        guard let email = emailTF.text else { return }
        if !email.isEmpty {
            DatabaseService.handlePasswordRecoveryEmail(email: email) { [weak self] error in
                guard let self = self else { return }
                guard error == nil else {
                    self.invalidBoardManager.showBulletin(above: self)
                    return
                }
                self.successBoardManager.showBulletin(above: self)
            }
        }
    }
}
