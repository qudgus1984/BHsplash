//
//  ViewModelType.swift
//  BHsplash
//
//  Created by 이병현 on 2023/03/11.
//

import Foundation

protocol ViewModelType {
    
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}
