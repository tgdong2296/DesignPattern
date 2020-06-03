//
//  ObservableCallback.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 6/3/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation

class ObservableCallback<Type> {
    weak var observer: AnyObject?
    let options: [ObservableOptions]
    let closure: (Type) -> Void
    
    init(observer: AnyObject,
         options: [ObservableOptions],
         closure: @escaping (Type) -> Void) {
        self.observer = observer
        self.options = options
        self.closure = closure
    }
}
