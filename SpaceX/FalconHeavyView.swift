//
//  FalconHeavyView.swift
//  SpaceX
//
//  Created by Павел Яковенко on 09.12.2022.
//

import UIKit

class FalconHeavyView: UIView {
    
    private let backgroudView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Falcon Heavy")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    private let testView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(backgroudView)
        translatesAutoresizingMaskIntoConstraints = false
//        addSubview(testView)
    }

}

extension FalconHeavyView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroudView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroudView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroudView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroudView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
//
//            testView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            testView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            testView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            testView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            
        ])
    }
}
