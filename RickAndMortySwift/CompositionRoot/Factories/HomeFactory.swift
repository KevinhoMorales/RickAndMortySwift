//
//  HomeFactory.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 1/31/23.
//

import Combine
import UIKit

protocol HomeFactory {
    func makeModule() -> UIViewController
}

struct HomeFactoryImplementation: HomeFactory {
    func makeModule() -> UIViewController {
        let menuRepository = MenuRepositoryImplementation()
        let loadMenuUseCase = LoadMenuUserCaseImplementation(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeViewModel = HomeMenuViewModelImplementation(state: state,
                                                            loadMenuUseCase: loadMenuUseCase)
        let homeViewController = HomeMenuViewController(viewModel: homeViewModel,
                                                        layout: makeLayout())
        homeViewController.title = "Rick And Morty"
        return homeViewController
    }
    
    private func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (UIScreen.main.bounds.width - 20) / 2
        let layoutHeight = (UIScreen.main.bounds.height - 20) / 2
        layout.itemSize = CGSize(width: layoutWidth, height: layoutWidth)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10)
        return layout
    }
}
