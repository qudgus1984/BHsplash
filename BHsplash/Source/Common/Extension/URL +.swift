//
//  URL +.swift
//  BHsplash
//
//  Created by 이병현 on 2022/10/31.
//

import Foundation

extension URL {
    static let searchPhotosURL = "https://api.unsplash.com/search/"
    
    static func makeSearchPhotosEndPointString(_ endpoint: String) -> String {
        return searchPhotosURL + endpoint
    }
    
}
