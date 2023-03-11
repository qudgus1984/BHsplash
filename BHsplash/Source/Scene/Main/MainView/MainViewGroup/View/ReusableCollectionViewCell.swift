//
//  ReuaableCollectionViewCell.swift
//  BHsplash
//
//  Created by 이병현 on 2022/10/31.
//

import UIKit
import Then

class ReusableCollectionViewCell: BaseCollectionViewCell {
    
    let nameLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 14)
    }

    
    let photoImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    override func configureUI() {
        [photoImageView, nameLabel].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        
        photoImageView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(photoImageView.snp.leading).inset(20)
            $0.bottom.equalTo(photoImageView.snp.bottom).inset(16)
        }
    }
}
