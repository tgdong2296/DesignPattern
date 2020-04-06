//
//  MediatorViewController.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/6/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import UIKit

class MediatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension MediatorViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.mediator
}
