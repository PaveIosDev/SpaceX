//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Павел Яковенко on 20.12.2022.
//

import UIKit

class LaunchesViewController: UIViewController {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Falcon Heavy"
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Закрыть", for: .normal)
        button.addTarget(self, action: #selector(closeButtonLaunchesTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none // разделение ячеек выключено
        tableView.bounces = false        // оттягивание таблицы выключено
        tableView.showsVerticalScrollIndicator = false // убирает вертикальную палку прокрутки
        tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let idTableViewCell = "idTableViewCell"
    
//        override func viewDidAppear(_ animated: Bool) {
//            super.viewDidAppear(animated)
//            setupViews()
//            setConstraints()
//            setDelegates()
//
//        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        setDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(nameLabel)
        view.addSubview(closeButton)
        view.addSubview(tableView)
        tableView.register(LaunchesTableViewCell.self, forCellReuseIdentifier: idTableViewCell)
//        view.addSubview(launchesTableView)
    }
    
    private func setDelegates () {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func closeButtonLaunchesTapped() {
        print("closeButtonLaunchesTapped")
        dismiss(animated: true)
    }
}

extension LaunchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idTableViewCell, for: indexPath) as? LaunchesTableViewCell else { return UITableViewCell()
        }
//        cell.backgroundColor = .orange
        return cell
    }
    
}

extension LaunchesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

//MARK: - setConstraints

extension LaunchesViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 54),
            nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            tableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)

        ])
    }
}
