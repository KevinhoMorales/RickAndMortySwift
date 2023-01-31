//
//  HomeFactory.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 1/31/23.
//

import UIKit

protocol HomeFactory {
    func makeModule() -> UIViewController
}

struct HomeFactoryImplementation: HomeFactory {
    func makeModule() -> UIViewController {
        HomeMenuViewController()
    }
}
