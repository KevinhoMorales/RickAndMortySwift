//
//  MenuRepositoryImplementation.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 2/1/23.
//

import Foundation

struct MenuRepositoryImplementation: MenuRepository {
    func fetchMenuData() async throws -> [MenuModel] {
        [MenuModel(title: "locations", url: "")]
    }
}
