//
//  BaseNavigationController.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/6/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let closeButton = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(back))
        navigationBar.topItem?.rightBarButtonItem = closeButton
    }
    
    @objc private func back() {
        dismiss(animated: true, completion: nil)
    }
}
