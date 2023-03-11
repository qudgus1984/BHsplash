//
//  MainViewController.swift
//  BHsplash
//
//  Created by 이병현 on 2023/03/11.
//

import UIKit

final class MainViewController: BaseViewController {
    
    private let selfView = MainView()
    
    private let viewModel = MainViewModel()
    
    weak var coordinator: MainCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
