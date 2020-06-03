//
//  Observable.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 6/3/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation

class Observable<Type> {
    
    var value: Type {
        didSet {
            removeNilObserverCallbacks()
            notifyCallbacks(value: oldValue, option: .old)
            notifyCallbacks(value: value, option: .new)
        }
    }
    
    private var callbacks: [ObservableCallback<Type>] = []
    
    init(_ value: Type) {
        self.value = value
    }
}

extension Observable {
    
    public func addObserver(_ observer: AnyObject,
                            removeIfExists: Bool = true,
                            options: [ObservableOptions] = [.new],
                            _ closure: @escaping (Type) -> Void) {
        if removeIfExists {
            removeObserver(observer)
        }
        
        let callback = ObservableCallback<Type>(observer: observer,
                                                options: options,
                                                closure: closure)
        callbacks.append(callback)
        if options.contains(.initial) {
            closure(value)
        }
    }
    
    func removeObserver(_ observer: AnyObject) {
        callbacks = callbacks.filter { $0.observer !== observer }
    }
}

extension Observable {
    
    private func removeNilObserverCallbacks() {
        callbacks = callbacks.filter { $0.observer != nil }
    }
    
    private func notifyCallbacks(value: Type, option: ObservableOptions) {
        let callbacksToNotify = callbacks.filter {
            $0.options.contains(option)
        }
        callbacksToNotify.forEach { $0.closure(value) }
    }
}
