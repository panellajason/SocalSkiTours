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
