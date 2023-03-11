//
//  Observable.swift
//  BHsplash
//
//  Created by 이병현 on 2022/10/31.
//

import Foundation

class Observable<T> {
    
    var listener: ( (T) -> Void )?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(completion: @escaping (T) -> Void) {
        completion(value)
        listener = completion
    }
}
