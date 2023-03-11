//
//  File.swift
//  BHsplash
//
//  Created by 이병현 on 2022/10/31.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

final class EditorialViewController: BaseViewController {
    
    private let mainView = EditorialView()
//    private let viewModel = EditorialViewModel()
    private var disposeBag = DisposeBag()
    private let viewModel = RxEditorialViewModel()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        
        // 처음엔 mainModelList의 데이터가 안들어어고 나중에 들어온다(viewWillDisappear에서 확인가능)
        // mainModelList는 옵저버블 형태이기 때문에 mainModelList의 데이터에 변화가 일어나면 반응하게된다.
        // 그렇다면 이 반응하는 시점에 reloadData()를 해주면 뷰가 리로드 되어 나타나게 되는것이다.
        // 즉 아래코든는 한 마디로 데이터가 들어온 시점에 reloadData()를 써줄 수 있다는 것이다.
        // 데이터가 다 들어온 시점이기 때문에 totalPages의 값도 제대로 들어간 것을 확인할 수 있다.

        
        
    }
    
    func bind() {
        viewModel.RxShowPhotos()
        viewModel.mainModelList.bind { _ in
            self.mainView.collectionView.reloadData()
        }
    }
    
    override func configure() {
        mainView.collectionView.register(ReusableCollectionViewCell.self, forCellWithReuseIdentifier: ReusableCollectionViewCell.reuseIdentifier)
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.prefetchDataSource = self
    }
}

extension EditorialViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return try! viewModel.mainModelList.value().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReusableCollectionViewCell.reuseIdentifier, for: indexPath) as? ReusableCollectionViewCell else { return UICollectionViewCell() }
        
        cell.photoImageView.kf.setImage(with: try! viewModel.mainModelList.value()[indexPath.item].imageURL)
        cell.nameLabel.text = try! viewModel.mainModelList.value()[indexPath.item].writer
        
        return cell
    }
}

extension EditorialViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            if try! viewModel.mainModelList.value().count - 1 == indexPath.item &&
                viewModel.currentPage.value() < viewModel.totalPages.value() {
                viewModel.currentPageUpdate()
                print("🍎🍎🍎🍎🍎🍎🍎",try! viewModel.currentPage.value())
                viewModel.RxShowPhotos()
                mainView.collectionView.reloadData()
            }
        }
    }
}
