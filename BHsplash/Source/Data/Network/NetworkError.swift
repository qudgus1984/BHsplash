//
//  NetworkError.swift
//  BHsplash
//
//  Created by 이병현 on 2023/03/11.
//

import Foundation

enum NetworkError: Error {
    case unexpectedData
    case decodingError
    case clientError
    case serverError
    case internalError
}
