//
//  EntryViewController.swift
//  BCLog
//
//  Created by Jason Panella on 9/6/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import FirebaseAuth

class EntryViewController: UIViewController {
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "toHome2", sender: self)
        } else {
            self.performSegue(withIdentifier: "toSignIn", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
