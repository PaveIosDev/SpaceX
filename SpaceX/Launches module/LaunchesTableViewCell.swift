//
//  LaunchesTableViewCell.swift
//  SpaceX
//
//  Created by Павел Яковенко on 20.12.2022.
//

import UIKit

class LaunchesTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
//        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
    }
}

//MARK: - setConstraints

extension LaunchesTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
        
        ])
    }
}
