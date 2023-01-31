//
//  MainFactory.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 1/31/23.
//

import UIKit

protocol MainFactory {
    func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator
}

struct MainFactoryImplementation: MainFactory {
    func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator {
        let homeFactory = HomeFactoryImplementation()
        let homeCoordinator = HomeCoordinator(navigation: navigation, homeFactory: homeFactory)
        return homeCoordinator
    }
}
