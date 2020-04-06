//
//  MainViewController.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/6/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let patterns: [DesignPattern] = [
        .mediator
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
    }

    private func configViews() {
        tableView.do {
            $0.register(cellType: MainTableViewCell.self)
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = 44
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patterns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setContentForCell(by: patterns[indexPath.row])
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var viewController = UIViewController()
        
        switch patterns[indexPath.row] {
        case .mediator:
            viewController = MediatorViewController.instantiate()
        }
        
        let navigationController = BaseNavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .overFullScreen
        present(navigationController, animated: true, completion: nil)
    }
}

extension MainViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.main
}
