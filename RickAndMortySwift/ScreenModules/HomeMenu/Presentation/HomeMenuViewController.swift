//
//  HomeMenuViewController.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 1/31/23.
//

import UIKit

final class HomeMenuViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpCollectionView()
    }

    private func setUpUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUpCollectionView() {
        collectionView.register(ItemHomeMenuCell.self, forCellWithReuseIdentifier: ItemHomeMenuCell.reuseIdentifier)
    }

}

extension HomeMenuViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemHomeMenuCell.reuseIdentifier, for: indexPath) as? ItemHomeMenuCell else { return UICollectionViewCell() }
        return cell
    }
}
