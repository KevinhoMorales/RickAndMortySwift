//
//  Coordinator.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 1/31/23.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get }
    func start()
}
