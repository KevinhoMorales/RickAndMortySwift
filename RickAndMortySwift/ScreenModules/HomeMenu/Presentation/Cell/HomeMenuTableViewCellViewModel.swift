//
//  HomeMenuTableViewCellViewModel.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 2/1/23.
//

struct HomeMenuTableViewCellViewModel {
    private let menuItem: MenuModel
    
    init(menuItem: MenuModel) {
        self.menuItem = menuItem
    }
    
    var title: String {
        menuItem.title.capitalized
    }
    
    var imageName: String {
        menuItem.title
    }
}
