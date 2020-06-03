//
//  ObserverPatternViewController.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 6/3/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import UIKit

class ObserverPatternViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    private let pointCounter = PointCounter.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pointCounter.isFinished.addObserver(self) { [weak self] isFinished in
            guard let self = self else { return }
            self.label.text = "SUCCESS!!!"
        }
    }
    
    deinit {
        pointCounter.isFinished.removeObserver(self)
    }
    
    @IBAction func handleButtonTapped(_ sender: UIButton) {
        pointCounter.increasePoint()
        
        guard pointCounter.currentPoint < 10 else { return }
        self.label.text = "\(pointCounter.currentPoint)"
    }
}

extension ObserverPatternViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.observer
}
