//
//  SeekNavigationController.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/7/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation
import UIKit

class SeekTabbarController: UITabBarController, MediatorType {
    var firstScreen = SeekViewController.instantiate()
    var secondsScreen = SeekViewController.instantiate()
    var thirdScreen = SeekViewController.instantiate()
    
    /// State in Mediator protocol, using for synchronize.
    var state: SeekState = SeekState()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
    }
    
    private func configViews() {
        delegate = self
        
        firstScreen.do {
            $0.mediator = self
            $0.title = "Be A Team"
            $0.tabBarItem = UITabBarItem().then {
                $0.title = "Item 1"
            }
        }
        secondsScreen.do {
            $0.mediator = self
            $0.title = "Think Outside The Box"
            $0.tabBarItem = UITabBarItem().then {
                $0.title = "Item 2"
            }
        }
        thirdScreen.do {
            $0.mediator = self
            $0.title = "Be Optimistics"
            $0.tabBarItem = UITabBarItem().then {
                $0.title = "Item 3"
            }
        }
        viewControllers = [
            firstScreen,
            secondsScreen,
            thirdScreen
        ]
    }
    
    /// This func will call when State is updated.
    /// - Parameters:
    ///   - sender: Originator object in Memento Pattern wich has State need to be set to another object.
    ///   - state: State need to be updated.
    func stateChange(sender: UIViewController, to state: SeekState) {
        self.state = state
    }
}

extension SeekTabbarController: UITabBarControllerDelegate {
 
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Set new State for ViewController each time change Tab.
        guard let originator = viewController as? Originator else { return }
        originator.synchronize(by: self.state)
    }
}
