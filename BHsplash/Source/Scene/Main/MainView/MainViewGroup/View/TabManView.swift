//
//  MainView.swift
//  BHsplash
//
//  Created by 이병현 on 2022/10/31.
//


import UIKit

final class TabManView: BaseView {

    let tabManBorder: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()

    override func configureUI() {
        self.addSubview(tabManBorder)
    }

    override func setConstraints() {
        tabManBorder.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).offset(1)
            $0.topMargin.equalTo(52.5)
        }
    }
}
