//
//  PreOnboardingViewController.swift
//  BCLog
//
//  Created by Jason Panella on 9/5/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit

class PreOnboardingViewController: UIViewController {
    let stackView = UIStackView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let getStartedButton = makeButton(withText: "Learn more", textColor: .white, backgroundColor: .systemBlue)
    let skipButton = makeButton(withText: "Skip", textColor: .white, backgroundColor: .systemGray)

    init() {
        super.init(nibName: nil, bundle: nil)
        imageView.image = UIImage(named: "jepson_ne")
        titleLabel.text = " Welcome! "
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    func style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 38)
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .white
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 5
 
        getStartedButton.addTarget(self, action: #selector(openOnboarding(_:)), for: .primaryActionTriggered)
        skipButton.addTarget(self, action: #selector(skipOnboarding (_:)), for: .primaryActionTriggered)
    }
        
    func layout() {
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(getStartedButton)
        stackView.addArrangedSubview(skipButton)

        view.backgroundColor = .black
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            getStartedButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            getStartedButton.heightAnchor.constraint(equalToConstant: 44),
            
            skipButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            skipButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    @objc func openOnboarding(_ sender: UIButton) {
        let vc = OnboardingPageViewController()
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        present(vc, animated: false, completion: nil)
    }
    
    @objc func skipOnboarding(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}
