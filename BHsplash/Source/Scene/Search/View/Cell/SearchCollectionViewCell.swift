//
//  SearchCollectionViewCell.swift
//  BHsplash
//
//  Created by 이병현 on 2022/11/01.
//

import UIKit

final class SearchCollectionViewCell: BaseCollectionViewCell {
    
    public let photoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "star")
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func configureUI() {
        self.contentView.addSubview(photoImage)
    }
    
    override func setConstraints() {
        photoImage.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
