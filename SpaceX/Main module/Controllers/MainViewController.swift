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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(backgroudView)
        scrollView.addSubview(rocketView)
        scrollView.isScrollEnabled = true
        rocketView.rocketViewDelegate = self
    }
}

//MARK: - RocketViewProtocol

extension MainViewController: RocketViewProtocol {
    
    func settigsButtonTapped() {
        print("settigsButtonTapped")
            let settingsViewController = SettingsViewController()
            settingsViewController.modalPresentationStyle = .fullScreen
            present(settingsViewController, animated: true)
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

