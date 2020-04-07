//
//  Synchronizable.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/7/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation

/// Memento Pattern
protocol Originator {
    
    /// State in Mediator protocol, using for synchronize.
    var state: SeekState { get set }
    
    /// This func will update an object with new State.
    /// - Parameter state: Newest State need to be updated in Object.
    func synchronize(by state: SeekState)
}
