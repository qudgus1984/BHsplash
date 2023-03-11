//
//  ReusableProtocol.swift
//  BHsplash
//
//  Created by 이병현 on 2022/10/31.
//

import UIKit

protocol ReusableProtocol: AnyObject {
    static var reuseIdentifier: String { get }
}

protocol MainVMProtocol {
    var mainModelList: Observable<[MainModel]> { get }
    var photoTitle: Observable<String> { get }
    var currentPage: Observable<Int> { get }
    var totalPages: Observable<Int> { get }
    
    func showPhotos()
}

protocol ReusableViewProtocol: AnyObject {
    static var reuseIdentifier: String { get }
    
}

extension UIViewController: ReusableViewProtocol {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableViewProtocol {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
extension UITableViewCell: ReusableViewProtocol {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
