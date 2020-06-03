//
//  PointCounter.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 6/3/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation

class PointCounter {
    static let shared = PointCounter()
    
    private(set) var currentPoint: Int = 0
    
    var isFinished = Observable<Bool>(false)
    
    private init() {
        
    }
    
    func increasePoint() {
        currentPoint += 1
        
        if currentPoint == 10 {
            isFinished.value = true
        }
    }
}
