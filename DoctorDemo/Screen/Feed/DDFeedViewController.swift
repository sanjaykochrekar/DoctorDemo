//
//  DDFeedViewController.swift
//  DoctorDemo
//
//  Created by Sanju on 19/09/23.
//

import UIKit



class DDFeedViewController: UIViewController {
    
    @IBOutlet weak var profileUIView: UIView!
    
    @IBOutlet weak var feedUICollectionView: UICollectionView!
    
    
    var contentOffSet: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCompositionLayout()
        registerCell()

    }
    
    
    private func registerCell() {
        feedUICollectionView.register(UINib(nibName: "DDFeedPostHeaderCVCell", bundle: nil), forCellWithReuseIdentifier: "DDFeedPostHeaderCVCell")
        feedUICollectionView.register(UINib(nibName: "DDSeeMoreTextCVCell", bundle: nil), forCellWithReuseIdentifier: "DDSeeMoreTextCVCell")
    }
    
    
    private func setCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex,enviroment in
            switch sectionIndex {
            case 0 :
                return self?.postSection()
            default:
                return self?.postSection()
            }
        }
        feedUICollectionView.collectionViewLayout = layout//.setCollectionViewLayout(layout, animated: true)
    }
    
    
    func postSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(180))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    
}


extension DDFeedViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDFeedPostHeaderCVCell", for: indexPath) as! DDFeedPostHeaderCVCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDSeeMoreTextCVCell", for: indexPath) as! DDSeeMoreTextCVCell
            return cell
        }
    }
    
}


extension DDFeedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


