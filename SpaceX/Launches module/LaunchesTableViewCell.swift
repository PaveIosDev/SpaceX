//
//  LaunchesTableViewCell.swift
//  SpaceX
//
//  Created by Павел Яковенко on 20.12.2022.
//

import UIKit

class LaunchesTableViewCell: UITableViewCell {
    
    private let backgroundCellView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let nameRocketLabel: UILabel = {
        let label = UILabel()
        label.text = "FalconSat"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLaunchLabel: UILabel = {
        let label = UILabel()
        label.text = "2 февраля, 2022"
        label.textColor = .specialTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let launchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rocket-green")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .background
        selectionStyle = .none
        addSubview(backgroundCellView)
        addSubview(nameRocketLabel)
        addSubview(dateLaunchLabel)
        addSubview(launchImageView)
    }
}

//MARK: - setConstraints

extension LaunchesTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            backgroundCellView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            backgroundCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            backgroundCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            backgroundCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            nameRocketLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            nameRocketLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 54),
            nameRocketLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -198),
            nameRocketLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -48),
            
            dateLaunchLabel.topAnchor.constraint(equalTo: topAnchor, constant: 52),
            dateLaunchLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 54),
            dateLaunchLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -166),
            dateLaunchLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            
            launchImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            launchImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            launchImageView.heightAnchor.constraint(equalToConstant: 32),
            launchImageView.widthAnchor.constraint(equalToConstant: 32)
        ])
    }
}
