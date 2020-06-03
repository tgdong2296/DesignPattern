//
//  ObservableOption.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 6/3/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation

struct ObservableOptions: OptionSet {
    
    public var rawValue: Int
    
    public static let initial = ObservableOptions(rawValue: 1 << 0)
    public static let old = ObservableOptions(rawValue: 1 << 1)
    public static let new = ObservableOptions(rawValue: 1 << 2)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
