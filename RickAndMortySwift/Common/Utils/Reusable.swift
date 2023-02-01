//
//  Reusable.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 2/1/23.
//

protocol Reusable {}

extension Reusable {
    static var reuseIdentifier: String { String(describing: self) } 
}
