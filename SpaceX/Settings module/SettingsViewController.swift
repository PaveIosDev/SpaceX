//
//  SettingsController.swift
//  SpaceX
//
//  Created by Павел Яковенко on 18.12.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    private let settingsNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Настройки"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Закрыть", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Высота"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let heightSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["m", "ft"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.addTarget(self, action: #selector(heightSegmentedChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let diametrLabel: UILabel = {
        let label = UILabel()
        label.text = "Диаметр"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let diametrSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["m", "ft"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.addTarget(self, action: #selector(diametrSegmentedChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Масса"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["kg", "lb"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.addTarget(self, action: #selector(weightSegmentedChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let payloadLabel: UILabel = {
        let label = UILabel()
        label.text = "полезная нагрузка"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let payloadSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["kg", "lb"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.addTarget(self, action: #selector(payloadSegmentedChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }

    
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(settingsNameLabel)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        view.addSubview(heightLabel)
        view.addSubview(heightSegmentedControl)
        view.addSubview(diametrLabel)
        view.addSubview(diametrSegmentedControl)
        view.addSubview(weightLabel)
        view.addSubview(weightSegmentedControl)
        view.addSubview(payloadLabel)
        view.addSubview(payloadSegmentedControl)
    }
    
    @objc private func closeButtonTapped() {
        print("closeButtonTapped")
        dismiss(animated: true)
    }
    
    @objc private func heightSegmentedChange() {
        print("heightSegmentedChange")
    }
    
    @objc private func diametrSegmentedChange() {
        print("diametrSegmentedChange")
    }
    
    @objc private func weightSegmentedChange() {
        print("weightSegmentedChange")
    }
    
    @objc private func payloadSegmentedChange() {
        print("payloadSegmentedChange")
    }
}

//MARK: - setConstraints

extension SettingsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            settingsNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            settingsNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            settingsNameLabel.widthAnchor.constraint(equalToConstant: 110),
            settingsNameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            closeButton.centerYAnchor.constraint(equalTo: settingsNameLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            heightLabel.topAnchor.constraint(equalTo: settingsNameLabel.bottomAnchor, constant: 80),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            heightSegmentedControl.centerYAnchor.constraint(equalTo: heightLabel.centerYAnchor),
            heightSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            heightSegmentedControl.widthAnchor.constraint(equalToConstant: 115),
            heightSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
        
            diametrLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 40),
            diametrLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),

            diametrSegmentedControl.centerYAnchor.constraint(equalTo: diametrLabel.centerYAnchor),
            diametrSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            diametrSegmentedControl.widthAnchor.constraint(equalToConstant: 115),
            diametrSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
            
            weightLabel.topAnchor.constraint(equalTo: diametrLabel.bottomAnchor, constant: 40),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),

            weightSegmentedControl.centerYAnchor.constraint(equalTo: weightLabel.centerYAnchor),
            weightSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            weightSegmentedControl.widthAnchor.constraint(equalToConstant: 115),
            weightSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
            
            payloadLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 40),
            payloadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),

            payloadSegmentedControl.centerYAnchor.constraint(equalTo: payloadLabel.centerYAnchor),
            payloadSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            payloadSegmentedControl.widthAnchor.constraint(equalToConstant: 115),
            payloadSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
