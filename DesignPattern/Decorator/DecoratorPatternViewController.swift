//
//  DecoratorPattern.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 5/19/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation
import UIKit

class DecoratorPatternViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
    }
    
    private func configViews() {
        
    }
}

extension DecoratorPatternViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.decorator
}
