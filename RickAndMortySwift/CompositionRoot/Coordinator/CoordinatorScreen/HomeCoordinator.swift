//
//  HomeCoordinator.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 1/31/23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var navigation: UINavigationController
    private let homeFactory: HomeFactory
    
    init(navigation: UINavigationController, homeFactory: HomeFactory) {
        self.navigation = navigation
        self.homeFactory = homeFactory
    }
    
    func start() {
        let homeMenuViewController = homeFactory.makeModule()
        navigation.pushViewController(homeMenuViewController, animated: true)
    }
}
