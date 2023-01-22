//
//  ViewController.swift
//  SpaceX
//
//  Created by Павел Яковенко on 09.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    private let rocketView = RocketView()
    
    private var slides = [RocketView]()

    
    private let backgroudView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Falcon Heavy")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
//        scrollView.frame = view.bounds
//        scrollView.contentSize = contentSize
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
//        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.tintColor = .orange
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
        
//    private var contentSize: CGSize {
//        CGSize(width: view.frame.width, height: view.frame.height + 400)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        setDelegates()
        
        slides = createSlides()
        setSlidesScrolView(slides: slides)
        
    }

    
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        scrollView.addSubview(backgroudView)
//        scrollView.addSubview(rocketView)
    }
    
    private func setDelegates() {
        scrollView.delegate = self
    }
    
    private func createSlides() -> [RocketView] {
        let firstRocketView = RocketView()
        firstRocketView.rocketViewDelegate = self
        firstRocketView.launchesViewDelegate = self
        firstRocketView.setNameLabelText(text: "FalconHeavy")

        let secondRocketView = RocketView()
        secondRocketView.rocketViewDelegate = self
        secondRocketView.launchesViewDelegate = self
        secondRocketView.setNameLabelText(text: "Starship")
        
        let thirdRocketView = RocketView()
        thirdRocketView.rocketViewDelegate = self
        thirdRocketView.launchesViewDelegate = self
        thirdRocketView.setNameLabelText(text: "Grasshopper")
        
        return [ firstRocketView, secondRocketView, thirdRocketView]
    }
    
    private func setSlidesScrolView(slides: [RocketView]) {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count),
                                        height: view.frame.height + 550)
        
        for i in 0..<slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i),
                                     y: 500,
                                     width: view.frame.width,
                                     height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
}

//MARK: - RocketViewProtocol

extension MainViewController: SettingsViewProtocol {

    func settingsButtonTapped() {
            let settingsViewController = SettingsViewController()
            settingsViewController.modalPresentationStyle = .fullScreen
            present(settingsViewController, animated: true)
    }
}

//MARK: - LaunchesViewProtocol

extension MainViewController: LaunchesViewProtocol {

    func launchesButtonTapped() {
        let launchesViewController = LaunchesViewController()
        launchesViewController.modalPresentationStyle = .fullScreen
        present(launchesViewController, animated: true)
    }
}

//MARK: - UIScrollViewDelegate

extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

//MARK: - setConstraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            pageControl.heightAnchor.constraint(equalToConstant: 50),
            
            backgroudView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backgroudView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            backgroudView.widthAnchor.constraint(equalToConstant: 570),
            backgroudView.heightAnchor.constraint(equalToConstant: 627),

//            rocketView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 348),
//            rocketView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            rocketView.widthAnchor.constraint(equalToConstant: 390),
//            rocketView.heightAnchor.constraint(equalToConstant: 1500)
        ])
    }
}

