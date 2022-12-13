//
//  FalconHeavyView.swift
//  SpaceX
//
//  Created by Павел Яковенко on 09.12.2022.
//

import UIKit

class FalconHeavyView: UIView {

    private let idInfoRocketCell = "idInfoRocketCell"
    
    private let backgroudView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Falcon Heavy")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 35
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Falcon Heavy"
        label.font = UIFont(name: "Helvetica", size: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let settigsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Setting"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVIew.translatesAutoresizingMaskIntoConstraints = false
        collectionVIew.bounces = false
        collectionVIew.showsHorizontalScrollIndicator = false
        collectionVIew.backgroundColor = .none
        return collectionVIew
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(backgroudView)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(infoView)
        addSubview(nameLabel)
        addSubview(settigsButton)
        settigsButton.addTarget(self, action: #selector(settigsButtonTapped), for: .touchUpInside)
        
        addSubview(collectionView)
        collectionView.register(InfoRocketCell.self, forCellWithReuseIdentifier: idInfoRocketCell)
    }

    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @objc private func settigsButtonTapped() {
        print("settigsButtonTapped")
    }
}


extension FalconHeavyView: UICollectionViewDataSource { // UICollectionViewDelegate ???
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idInfoRocketCell, for: indexPath) as? InfoRocketCell else { return UICollectionViewCell()
        }
        return cell
    }
}
//

//MARK: - UICollectionViewDelegateFlowLayout

extension FalconHeavyView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 96,
               height: 96)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}

extension FalconHeavyView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroudView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroudView.widthAnchor.constraint(equalToConstant: 570),
            backgroudView.heightAnchor.constraint(equalToConstant: 627),
            backgroudView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            infoView.topAnchor.constraint(equalTo: topAnchor, constant: 348),
            infoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoView.widthAnchor.constraint(equalToConstant: 390),
            infoView.heightAnchor.constraint(equalToConstant: 920),
            
            nameLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 48),
            nameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 32),
  
            settigsButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            settigsButton.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -35),
            
            collectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
            
        ])
    }
}
