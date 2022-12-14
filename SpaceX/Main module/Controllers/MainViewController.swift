//
//  ViewController.swift
//  SpaceX
//
//  Created by Павел Яковенко on 09.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    private let falconHeavyView = FalconHeavyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.addSubview(falconHeavyView)
    }
}
//grht

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            falconHeavyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            falconHeavyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),  
            falconHeavyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            falconHeavyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}

