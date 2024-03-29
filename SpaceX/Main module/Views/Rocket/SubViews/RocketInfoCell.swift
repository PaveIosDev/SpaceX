//
//  RocketInfoCell.swift
//  SpaceX
//
//  Created by Павел Яковенко on 13.12.2022.
//

import UIKit

class RocketInfoCell: UICollectionViewCell {
    
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "999"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Высота, ft"
        label.textColor = .specialTextColor
        label.textAlignment = .center
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
        layer.cornerRadius = 32
        backgroundColor = .specialBackground
        
        addSubview(valueLabel)
        addSubview(nameLabel)
    }
}

extension RocketInfoCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([

            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 28),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 52),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
