//
//  PageViewController.swift
//  SpaceX
//
//  Created by Павел Яковенко on 11.01.2023.
//

import UIKit

class PageViewController: UIPageViewController {

    var rockets = [RocketHelper]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let firstRocket = RocketHelper(name: "Falcon Heavy")
        let secondRocket = RocketHelper(name: "Other Rocket")
        rockets.append(firstRocket)
        rockets.append(secondRocket)
    }
    
//    var arrayRocketViewController: [RocketView] = {
//        var rocketsVC = [RocketView]()
//        for rocket in rockets {
//            rocketsVC.append(RocketView(frame: rocket))
//        }
//        return rocketsVC
//    }()

}
