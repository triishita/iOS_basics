//
//  ViewController.swift
//  AppStore
//
//  Created by user@89 on 23/10/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DataModel.section.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return DataModel.apps.count
        } else if section == 1 {
            return DataModel.standardApps.count
        } else if section == 2 {
            return DataModel.standardApps.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "promoted", for: indexPath)
            let app = DataModel.apps[indexPath.row]
            if let cell = cell as? PromotedCollectionViewCell {
                cell.titleLabel.text = app.title
                cell.headingLabel.text = app.subtitle
                cell.subtitleLabel.text = app.subtitle
                cell.imageView.backgroundColor = app.color
                cell.imageView.image = UIImage(named: app.image)
                
                //add shadows
                cell.layer.cornerRadius = 10.0
                cell.layer.shadowColor = UIColor.black.cgColor
                cell.layer.shadowOpacity = 0.6
                cell.layer.masksToBounds = false
                cell.layer.shadowOffset = CGSize(width: 1.0, height: 5.0)
            }
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "standard", for: indexPath)
            if let cell = cell as? StandardCollectionViewCell {
                let app = DataModel.standardApps[indexPath.row]
                cell.imageView.backgroundColor = app.color
                cell.titleLabel.text = app.title
                cell.subtitleLabel.text = app.subtitle
                return cell
            }
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "standard", for: indexPath)
            if let cell = cell as? StandardCollectionViewCell {
                let app = DataModel.standardApps[indexPath.row]
                cell.imageView.backgroundColor = app.color
                cell.titleLabel.text = app.title
                cell.subtitleLabel.text = app.subtitle
                return cell
            }
        }
        
        //in case section is not zero, return an empty cell
        return UICollectionViewCell()
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section, any) -> NSCollectionLayoutSection? in
            
            let sectionType = DataModel.section[section]
            switch sectionType {
            case .promoted, .categories:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(300))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
                
            case .standard:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.33))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(300))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
            }
        }
        return layout
    }
}
