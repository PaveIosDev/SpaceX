//
//  ViewController.swift
//  SpaceX
//
//  Created by Павел Яковенко on 09.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    private let rocketFalconHeavyView = RocketFalconHeavyView()
    
    private var slides = [UIView]()

    
    private let backgroudView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Falcon Heavy")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
//        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.tintColor = .orange
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
        
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 400)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegates()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        scrollView.addSubview(backgroudView)
        scrollView.addSubview(rocketFalconHeavyView)
    }
    
    private func setDelegates() {
        rocketFalconHeavyView.rocketViewDelegate = self
        rocketFalconHeavyView.launchesViewDelegate = self
    }
    
//    private func createSlides() -> [UIView] {
//        let rocketFalconHeavy = RocketView()
//    }
}

//MARK: - RocketViewProtocol

extension MainViewController: SettingsViewProtocol {
    
    func settingsButtonTapped() {
        print("settingsButtonTapped")
            let settingsViewController = SettingsViewController()
            present(settingsViewController, animated: true)
    }
}

//MARK: - LaunchesViewProtocol

extension MainViewController: LaunchesViewProtocol {
    
    func launchesButtonTapped() {
        let launchesViewController = LaunchesViewController()
        launchesViewController.modalPresentationStyle = .fullScreen
        present(launchesViewController, animated: true)
    }
}

//MARK: - setConstraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            pageControl.heightAnchor.constraint(equalToConstant: 50),
            
            backgroudView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backgroudView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            backgroudView.widthAnchor.constraint(equalToConstant: 570),
            backgroudView.heightAnchor.constraint(equalToConstant: 627),

            rocketFalconHeavyView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 348),
            rocketFalconHeavyView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            rocketFalconHeavyView.widthAnchor.constraint(equalToConstant: 390),
            rocketFalconHeavyView.heightAnchor.constraint(equalToConstant: 1500)
        ])
    }
}

