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
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //feedUICollectionView.collectionViewLayout.invalidateLayout()
    }
    
    
    private func registerCell() {
        feedUICollectionView.register(UINib(nibName: "DDFeedPostHeaderCVCell", bundle: nil), forCellWithReuseIdentifier: "DDFeedPostHeaderCVCell")
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
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    
}


extension DDFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDFeedPostHeaderCVCell", for: indexPath) as! DDFeedPostHeaderCVCell
        return cell
    }
    
    
}


extension DDFeedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


