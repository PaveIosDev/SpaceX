//
//  infoRocketCell.swift
//  SpaceX
//
//  Created by Павел Яковенко on 13.12.2022.
//

import UIKit

class InfoRocketCell: UICollectionViewCell {
    
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "999"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "999"
        label.textColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5568627451, alpha: 1)
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
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        addSubview(valueLabel)
        addSubview(nameLabel)
    }
}

extension InfoRocketCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 28),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 52),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        
        ])
    }
}
