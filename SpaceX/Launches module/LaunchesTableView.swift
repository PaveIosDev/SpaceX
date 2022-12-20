//
//  LaunchesTableView.swift
//  SpaceX
//
//  Created by Павел Яковенко on 20.12.2022.
//

import UIKit

class LaunchesTableView: UITableView {
    
    private let idLaunchesTableViewCell = "idLaunchesTableViewCell"
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegates()
        register(LaunchesTableViewCell.self, forCellReuseIdentifier: idLaunchesTableViewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .red
        separatorStyle = .none // разделение ячеек выключено
        bounces = false        // оттягивание таблицы выключено
        showsVerticalScrollIndicator = false // убирает вертикальную палку прокрутки
        delaysContentTouches = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
}

extension LaunchesTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idLaunchesTableViewCell, for: indexPath) as? LaunchesTableViewCell else { return UITableViewCell()
        }
        return cell
    }
    
}

extension LaunchesTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
