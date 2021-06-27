//
//  ViewController.swift
//  Easy layout
//
//  Created by Nitanta Adhikari on 6/26/21.
//

import UIKit

class ViewController: UIViewController {

    let ds: [[UIColor]] = [
        [.red, .gray, .green, .darkGray, .purple, .blue, .black, .brown, .cyan, .yellow],
        [.red, .gray, .green, .darkGray, .purple, .blue, .black, .brown, .cyan, .yellow],
        [.red, .gray, .green, .darkGray, .purple, .blue, .black, .brown, .cyan, .yellow]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    var collectionView: UICollectionView! = nil

    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: getCellLayout())
        collectionView.backgroundColor = .white
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
    }
    
    func getCellLayout() -> UICollectionViewCompositionalLayout {
        let inset: CGFloat = 2.5
        
        // Items
        let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
        largeItem.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        smallItem.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
                
        let smallerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1))
        let smallerGroup = NSCollectionLayoutGroup.vertical(layoutSize: smallerGroupSize, subitems: [smallItem])
        
        let largerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let largerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: largerGroupSize, subitems: [largeItem, smallerGroup, smallerGroup])
        
        // Section
        let section = NSCollectionLayoutSection(group: largerGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        // Supplementary Item
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
        section.boundarySupplementaryItems = [headerItem]
         
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ds.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ds[section].count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        cell.backgroundColor = ds[indexPath.section][indexPath.row]
        return cell
    }
}

