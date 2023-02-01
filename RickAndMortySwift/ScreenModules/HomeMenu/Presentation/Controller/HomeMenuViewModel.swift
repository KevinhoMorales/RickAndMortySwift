//
//  HomeMenuViewModel.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 2/1/23.
//

import Combine
import Foundation

protocol HomeMenuViewModel {
    var state: PassthroughSubject<StateController, Never> { get set }
    var menuItemsCount: Int { get }
    func viewDidLoad()
    func getItemMenuViewModel(indexPath: IndexPath) -> HomeMenuTableViewCellViewModel
    func getMenuItem(indexPath: IndexPath) -> MenuModel
}


final class HomeMenuViewModelImplementation: HomeMenuViewModel {
    var state: PassthroughSubject<StateController, Never>
    
    var menuItemsCount: Int {
        menuItems.count
    }
    
    private let loadMenuUseCase: LoadMenuUseCase
    private var menuItems: [MenuModel] = []
    
    init(state: PassthroughSubject<StateController, Never>, loadMenuUseCase: LoadMenuUseCase) {
        self.state = state
        self.loadMenuUseCase = loadMenuUseCase
    }
    
    func viewDidLoad() {
        fetchData()
    }
    
    private func fetchData() {
        state.send(.loading)
        Task {
            let result = await loadMenuUseCase.execute()
            updateUI(result: result)
        }
    }
    
    private func updateUI(result: Result<[MenuModel], Error>) {
        switch result {
        case .success(let menuItems):
            self.menuItems = menuItems
            state.send(.success)
        case .failure(let error):
            state.send(.failure(error: error.localizedDescription))
        }
    }
    
    func getItemMenuViewModel(indexPath: IndexPath) -> HomeMenuTableViewCellViewModel {
        let menuItem = menuItems[indexPath.row]
        return HomeMenuTableViewCellViewModel(menuItem: menuItem)
    }
    
    func getMenuItem(indexPath: IndexPath) -> MenuModel {
        menuItems[indexPath.row]
    }
    
    
}
