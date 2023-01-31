//
//  MainCoordinator.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 1/31/23.
//

import UIKit

final class MainCoordinator: Coordinator {
    var navigation: UINavigationController
    private let mainFactory: MainFactory
    
    init(navigation: UINavigationController, mainFactory: MainFactory, window: UIWindow?) {
        self.navigation = navigation
        self.mainFactory = mainFactory
        configWindow(window: window)
    }
    
    func start() {
        let coordinator = mainFactory.makeHomeCoordinator(navigation: navigation)
        coordinator.start()
    }
    
    private func configWindow(window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
