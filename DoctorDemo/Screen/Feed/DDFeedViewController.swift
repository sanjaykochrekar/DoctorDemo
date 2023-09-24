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
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    
    
    var contentOffSet: CGFloat = 100.0
    var currentHeaderHeight: CGFloat? = 0.0
    lazy var vm = DDFeedVM()
    
    private var oldContentOffset = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCompositionLayout()
        registerCell()
        vm.addData()
    }
    
    
    private func registerCell() {
        feedUICollectionView.register(UINib(nibName: "DDFeedPostHeaderCVCell", bundle: nil), forCellWithReuseIdentifier: "DDFeedPostHeaderCVCell")
        feedUICollectionView.register(UINib(nibName: "DDSeeMoreTextCVCell", bundle: nil), forCellWithReuseIdentifier: "DDSeeMoreTextCVCell")
        feedUICollectionView.register(UINib(nibName: "DDPostActionCVCell", bundle: nil), forCellWithReuseIdentifier: "DDPostActionCVCell")
        feedUICollectionView.register(UINib(nibName: "DDLocationCVCell", bundle: nil), forCellWithReuseIdentifier: "DDLocationCVCell")
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
        feedUICollectionView.collectionViewLayout = layout
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
        vm.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.data[section].data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDFeedPostHeaderCVCell", for: indexPath) as! DDFeedPostHeaderCVCell
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDSeeMoreTextCVCell", for: indexPath) as! DDSeeMoreTextCVCell
            cell.populate(DDPostTextDataModel(), indexPath: indexPath)
            cell.delegate = self
            return cell
          
        } else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDLocationCVCell", for: indexPath) as! DDLocationCVCell
            return cell
        } else {
           
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDPostActionCVCell", for: indexPath) as! DDPostActionCVCell
            return cell
        }
    }
    
}


extension DDFeedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


extension DDFeedViewController: DDListViewDelegate {
    func reloadCellAtIndexPath(indexPath: IndexPath) {
        // feedUICollectionView.reloadItems(at: [indexPath])
    }
    
}


extension DDFeedViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > contentOffSet {
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.profileUIView.isHidden = true
                //self?.headerViewHeightConstraint.constant = 0
            }
        } else if scrollView.contentOffset.y < contentOffSet {
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.profileUIView.isHidden = false

//                self?.headerViewHeightConstraint.constant = 40
            }
        }
        contentOffSet = scrollView.contentOffset.y
    }
}
