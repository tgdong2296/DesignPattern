//
//  MediatorType.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/7/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation

/// Mediator Pattern
protocol MediatorType {
    
    /// This func will call when State is updated.
    /// - Parameters:
    ///   - sender: Originator object in Memento Pattern wich has State need to be set to another object.
    ///   - state: State need to be updated.
    func stateChange(sender: UIViewController, to state: SeekState)
}
