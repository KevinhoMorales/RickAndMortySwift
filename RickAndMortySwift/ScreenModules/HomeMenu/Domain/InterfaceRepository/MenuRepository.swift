//
//  MenuRepository.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 2/1/23.
//

protocol MenuRepository {
    func fetchMenuData() async throws -> [MenuModel]
}
