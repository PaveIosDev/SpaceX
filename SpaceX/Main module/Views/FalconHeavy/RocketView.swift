//
//  RocketView.swift
//  SpaceX
//
//  Created by Павел Яковенко on 09.12.2022.
//

import UIKit

protocol SettingsViewProtocol: AnyObject {
    func settingsButtonTapped()
}

protocol LaunchesViewProtocol: AnyObject {
    func launchesButtonTapped()
}

class RocketView: UIView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Falcon Heavy"
        label.font = UIFont(name: "Helvetica", size: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var settigsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "Setting"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let rocketParametersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 3
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionVIew.bounces = false
        collectionVIew.showsHorizontalScrollIndicator = false
        collectionVIew.translatesAutoresizingMaskIntoConstraints = false
        collectionVIew.backgroundColor = .none
        return collectionVIew
    }()
    
//    private let launchesButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Посмотреть запуски", for: .normal)
//        button.layer.cornerRadius = 15
//        button.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
//        button.addTarget(self, action: #selector(launchesButtonTapped), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    private let idInfoRocketCell = "idInfoRocketCell"
//    private let rocketInfoView = RocketInfoView()
//    private let firstStageView = FirstStageView()
//    private let secondStageView = SecondStageView()
//    weak var rocketViewDelegate: SettingsViewProtocol?
//    weak var launchesViewDelegate: LaunchesViewProtocol?
    
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
        backgroundColor = .black
        layer.cornerRadius = 35
        addSubview(nameLabel)
        addSubview(settigsButton)
        addSubview(rocketParametersCollectionView)
        rocketParametersCollectionView.register(RocketInfoCell.self, forCellWithReuseIdentifier: idInfoRocketCell)
//        addSubview(rocketInfoView)
//        addSubview(firstStageView)
//        addSubview(secondStageView)
//        addSubview(launchesButton)
//        launchesButton.addTarget(self, action: #selector(launchesButtonTapped), for: .touchUpInside)

    }

    private func setDelegates() {
        rocketParametersCollectionView.dataSource = self
        rocketParametersCollectionView.delegate = self
    }
    
    @objc func settingsButtonTapped() {
        print("settingsButtonTapped")
//        rocketViewDelegate?.settingsButtonTapped()
    }
//
//
//    @objc private func launchesButtonTapped() {
//        launchesViewDelegate?.launchesButtonTapped()
//        print("launchesButtonTapped")
//    }
}

//MARK: - UICollectionViewDataSource

extension RocketView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idInfoRocketCell, for: indexPath) as? RocketInfoCell else { return UICollectionViewCell()
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension RocketView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension RocketView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 96,
               height: 96)
    }
}

//MARK: - setConstraints

extension RocketView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
  
            settigsButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            settigsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            
            rocketParametersCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 112),
            rocketParametersCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            rocketParametersCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            rocketParametersCollectionView.bottomAnchor.constraint(equalTo: topAnchor, constant: 208)

//            rocketInfoView.topAnchor.constraint(equalTo: rocketParametersCollectionView.bottomAnchor, constant: 5),
//            rocketInfoView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            rocketInfoView.widthAnchor.constraint(equalToConstant: 388),
//            rocketInfoView.heightAnchor.constraint(equalToConstant: 140),
//
//            firstStageView.topAnchor.constraint(equalTo: rocketInfoView.bottomAnchor, constant: 0),
//            firstStageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            firstStageView.widthAnchor.constraint(equalToConstant: 388),
//            firstStageView.heightAnchor.constraint(equalToConstant: 190),
//
//            secondStageView.topAnchor.constraint(equalTo: firstStageView.bottomAnchor, constant: 0),
//            secondStageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            secondStageView.widthAnchor.constraint(equalToConstant: 388),
//            secondStageView.heightAnchor.constraint(equalToConstant: 190),
            
//            launchesButton.topAnchor.constraint(equalTo: secondStageView.bottomAnchor, constant: 30),
//            launchesButton.centerXAnchor.constraint(equalTo: centerXAnchor),
//            launchesButton.widthAnchor.constraint(equalToConstant: 350),
//            launchesButton.heightAnchor.constraint(equalToConstant: 70)
            
        ])
    }
}
