//
//  FirstStageView.swift
//  SpaceX
//
//  Created by Павел Яковенко on 18.12.2022.
//

import UIKit

class FirstStageView: UIView {
    
    private let firstStageLabel: UILabel = {
        let label = UILabel()
        label.text = "Первая ступень"
        label.font = UIFont(name: "Helvetica", size: 26)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countEnginesLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество двигателей"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let valueCountEnginesLabel: UILabel = {
        let label = UILabel()
        label.text = "27"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countFuelLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество топлива"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let valueCountFuelLabel: UILabel = {
        let label = UILabel()
        label.text = "308,6 ton"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let combustionTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Время сгорания"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let valueCombustionTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "593 sec"
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

        addSubview(firstStageLabel)
        addSubview(countEnginesLabel)
        addSubview(valueCountEnginesLabel)
        addSubview(countFuelLabel)
        addSubview(valueCountFuelLabel)
        addSubview(combustionTimeLabel)
        addSubview(valueCombustionTimeLabel)
    }
}

//MARK: - setConstraints

extension FirstStageView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            firstStageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            firstStageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),

            countEnginesLabel.topAnchor.constraint(equalTo: firstStageLabel.bottomAnchor, constant: 16),
            countEnginesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),

            valueCountEnginesLabel.centerYAnchor.constraint(equalTo: countEnginesLabel.centerYAnchor),
            valueCountEnginesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),

            countFuelLabel.topAnchor.constraint(equalTo: countEnginesLabel.bottomAnchor, constant: 16),
            countFuelLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),

            valueCountFuelLabel.centerYAnchor.constraint(equalTo: countFuelLabel.centerYAnchor),
            valueCountFuelLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),

            combustionTimeLabel.topAnchor.constraint(equalTo: countFuelLabel.bottomAnchor, constant: 16),
            combustionTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),

            valueCombustionTimeLabel.centerYAnchor.constraint(equalTo: combustionTimeLabel.centerYAnchor),
            valueCombustionTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
        ])
    }
}
