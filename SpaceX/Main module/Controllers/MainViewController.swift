//
//  ViewController.swift
//  SpaceX
//
//  Created by Павел Яковенко on 09.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    private let rocketView = RocketView()
    
    private let backgroudView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Falcon Heavy")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
        
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 400)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        setupViews()
//        setConstraints()
//        setDelegates()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegates()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(backgroudView)
        scrollView.addSubview(rocketView)
        scrollView.isScrollEnabled = true
    }
    
    private func setDelegates() {
        rocketView.rocketViewDelegate = self
        rocketView.launchesViewDelegate = self
    }
}

//MARK: - RocketViewProtocol

extension MainViewController: SettingsViewProtocol {
    
    func settingsButtonTapped() {
        print("settingsButtonTapped")
            let settingsViewController = SettingsViewController()
            settingsViewController.modalPresentationStyle = .fullScreen
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
            
            backgroudView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backgroudView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            backgroudView.widthAnchor.constraint(equalToConstant: 570),
            backgroudView.heightAnchor.constraint(equalToConstant: 627),

            rocketView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 348),
            rocketView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            rocketView.widthAnchor.constraint(equalToConstant: 390),
            rocketView.heightAnchor.constraint(equalToConstant: 1500)
        ])
    }
}

