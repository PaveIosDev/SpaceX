//
//  RocketInfoView.swift
//  SpaceX
//
//  Created by Павел Яковенко on 14.12.2022.
//

import UIKit

class RocketInfoView: UIView {
    
    private let firstStartLabel: UILabel = {
        let label = UILabel()
        label.text = "Первый запуск"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueFirstStartLabel: UILabel = {
        let label = UILabel()
        label.text = "7 февраля, 2018"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Страна"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueCountryLabel: UILabel = {
        let label = UILabel()
        label.text = "США"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let costLaunchLabel: UILabel = {
        let label = UILabel()
        label.text = "Стоимость запуска"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueCostLaunchLabel: UILabel = {
        let label = UILabel()
        label.text = "$90 млн"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(firstStartLabel)
        addSubview(valueFirstStartLabel)
        addSubview(countryLabel)
        addSubview(valueCountryLabel)
        addSubview(costLaunchLabel)
        addSubview(valueCostLaunchLabel)
    }
    
}

//MARK: - setConstraints

extension RocketInfoView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            firstStartLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            firstStartLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            valueFirstStartLabel.centerYAnchor.constraint(equalTo: firstStartLabel.centerYAnchor),
            valueFirstStartLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            countryLabel.topAnchor.constraint(equalTo: firstStartLabel.bottomAnchor, constant: 16),
            countryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            valueCountryLabel.centerYAnchor.constraint(equalTo: countryLabel.centerYAnchor),
            valueCountryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            costLaunchLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 16),
            costLaunchLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            valueCostLaunchLabel.centerYAnchor.constraint(equalTo: costLaunchLabel.centerYAnchor),
            valueCostLaunchLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }
}
