//
//  Endpoint.swift
//  BHsplash
//
//  Created by 이병현 on 2022/10/31.
//

import Foundation

enum EndPoint {
    case searchPhotos
    
    var requestURL: String {
        switch self {
        case .searchPhotos:
            return URL.makeSearchPhotosEndPointString("photos?client_id=")
        }
    }
}
