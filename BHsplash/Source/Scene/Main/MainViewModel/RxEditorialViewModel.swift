//
//  RxEditorialViewModel.swift
//  BHsplash
//
//  Created by 이병현 on 2022/11/01.
//

import Foundation
import RxAlamofire
import RxSwift
import RxCocoa

final class RxEditorialViewModel {
    
    public var mainModelList: BehaviorSubject<[MainModel]> = BehaviorSubject(value: [])
    internal var photoTitle = BehaviorSubject(value: "Editorial")
    public var currentPage = BehaviorSubject(value: 1)
    public var totalPages = BehaviorSubject(value: 0)

    
    public func RxShowPhotos() {
        
        APIManager.shared.requestPhtosData(type: .searchPhotos, title: try! photoTitle.value(), page: try! totalPages.value()) { json in
            self.totalPages = BehaviorSubject(value: json["total_pages"].intValue)
            print("🌱🌱🌱🌱🌱🌱",json)
            self.mainModelList
                .onNext(json["results"].arrayValue.map({
                    MainModel(
                        imageURL: URL(string: $0["urls"]["small"].stringValue)!,
                        writer: $0["user"]["name"].stringValue
                    )
                }))
        }
    }
    
    public func currentPageUpdate() {
        currentPage
            .map { $0 + 1 }
            .bind(onNext: { $0 })
            .disposed(by: DisposeBag())
    }
}
