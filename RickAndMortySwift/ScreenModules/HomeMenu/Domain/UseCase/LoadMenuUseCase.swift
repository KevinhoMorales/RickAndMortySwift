//
//  LoadMenuUseCase.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 2/1/23.
//

protocol LoadMenuUseCase {
    func execute() async -> Result<[MenuModel], Error>
}

struct LoadMenuUserCaseImplementation: LoadMenuUseCase {
    let menuRepository: MenuRepository
    
    func execute() async -> Result<[MenuModel], Error> {
        do {
            let repositoryResult = try await menuRepository.fetchMenuData()
            return .success(repositoryResult)
        } catch {
            return .failure(error)
        }
    }
}
