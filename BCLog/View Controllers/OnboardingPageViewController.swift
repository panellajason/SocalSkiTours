//
//  OnboardingViewController.swift
//  BCLog
//
//  Created by Jason Panella on 9/5/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import EEZoomableImageView

class OnboardingPageViewController: UIPageViewController {

    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    let initialPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPages()
        style()
        layout()
    }
    
    func setupPages() {
        
        dataSource = self
        delegate = self
        
        let page1 = OnboardingViewController(imageName: "OB1",
                                             titleText: "Home",
                                             subtitleText: "The Home tab displays the entire collection of ski tours. Tap on any tour to view its details. Tap on the search icon to filter by keyword or region.")
        let page2 = OnboardingViewController(imageName: "OB2",
                                             titleText: "Tour Details",
                                             subtitleText: "Once a tour is chosen, swipe-to-view all of its photos and pinch-to-zoom. Tap on the star icon to favorite. The route and weather, as well as other relevant details are also listed.")
        let page3 = OnboardingViewController(imageName: "OB3",
                                             titleText: "Map",
                                             subtitleText: "The Map tab displays routes, trailheads, and summit markers for all of the ski tours. Tap on summit markers (blue icons) for details.")
        let page4 = OnboardingViewController(imageName: "OB4",
                                             titleText: "Resources",
                                             subtitleText: "The Resources tab contains links to information about the snow and weather, as well as links to live cameras.")
        let page5 = LastOnboardingViewController(imageName: "OB5",
                                                 titleText: "Favorites",
                                                 subtitleText: "The Favorites tab displays the tours you have favorited. Tap on any tour to view its details. Swipe to delete and press-and-hold to reorganize. Tap on the account icon to logout.")
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        pages.append(page5)
        setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
    }
    
    func style() {
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .systemGray5
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    
    func layout() {
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1),
        ])
    }
}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return nil
        } else {
            return pages[currentIndex - 1]  // go previous
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }

        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else {
            return nil
        }
    }
}

extension OnboardingPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
}

class OnboardingViewController: UIViewController {
    let stackView = UIStackView()
    let imageView = EEZoomableImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    init(imageName: String, titleText: String, subtitleText: String) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = UIImage(named: imageName)
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
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
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .white

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .white
        subtitleLabel.numberOfLines = 0
    }
        
    func layout() {
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        view.backgroundColor = .black
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.trailingAnchor, multiplier: 2),
        ])
    }
}

class LastOnboardingViewController: UIViewController {
    let stackView = UIStackView()
    let imageView = EEZoomableImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let endOnboardingButton = makeButton(withText: "Continue", textColor: .white, backgroundColor: .systemBlue)

    init(imageName: String, titleText: String, subtitleText: String) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = UIImage(named: imageName)
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    @objc func endOnBoarding(_ sender: UIButton) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    func style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .white

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .white
        subtitleLabel.numberOfLines = 0
        
        endOnboardingButton.addTarget(self, action: #selector(endOnBoarding(_:)), for: .primaryActionTriggered)
    }
        
    func layout() {
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(endOnboardingButton)
        view.backgroundColor = .black
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.trailingAnchor, multiplier: 2),
            
            endOnboardingButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            endOnboardingButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}


func makeButton(withText text: String, textColor: UIColor, backgroundColor: UIColor) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    button.setTitleColor(textColor, for: .normal)
    button.backgroundColor = backgroundColor
    button.layer.cornerRadius = 8
    return button
}