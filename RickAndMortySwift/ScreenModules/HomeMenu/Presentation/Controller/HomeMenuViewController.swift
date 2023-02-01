//
//  HomeMenuViewController.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 1/31/23.
//

import UIKit
import Combine

final class HomeMenuViewController: UICollectionViewController {

    private let viewModel: HomeMenuViewModel
    private var cancellable = Set<AnyCancellable>()
    init(viewModel: HomeMenuViewModel, layout: UICollectionViewFlowLayout) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpCollectionView()
        stateController()
        viewModel.viewDidLoad()
    }
    
    private func stateController() {
        viewModel
            .state
            .receive(on: RunLoop.main)
            .sink { state in
            switch state {
            case .success:
                self.collectionView.reloadData()
            case .loading:
                print("LOADING")
            case .failure(error: let error):
                print("ERROR -> \(error)!")
            }
        }.store(in: &cancellable)
    }

    private func setUpUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUpCollectionView() {
        collectionView.register(HomeMenuTableViewCell.self, forCellWithReuseIdentifier: HomeMenuTableViewCell.reuseIdentifier)
    }

}

extension HomeMenuViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.menuItemsCount
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuTableViewCell.reuseIdentifier, for: indexPath) as? HomeMenuTableViewCell else { return UICollectionViewCell() }
        let viewModelCell = viewModel.getItemMenuViewModel(indexPath: indexPath)
        cell.setUpData(viewModel: viewModelCell)
        return cell
    }
}
