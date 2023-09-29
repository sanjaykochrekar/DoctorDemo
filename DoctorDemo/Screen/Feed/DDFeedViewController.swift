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
        
        setCompositionLayout()
        registerCell()
        vm.addData()
    }
    
    
    private func registerCell() {
        feedUICollectionView.register(UINib(nibName: "DDFeedPostHeaderCVCell", bundle: nil), forCellWithReuseIdentifier: "DDFeedPostHeaderCVCell")
        feedUICollectionView.register(UINib(nibName: "DDSeeMoreTextCVCell", bundle: nil), forCellWithReuseIdentifier: "DDSeeMoreTextCVCell")
        feedUICollectionView.register(UINib(nibName: "DDPostActionCVCell", bundle: nil), forCellWithReuseIdentifier: "DDPostActionCVCell")
        feedUICollectionView.register(UINib(nibName: "DDLocationCVCell", bundle: nil), forCellWithReuseIdentifier: "DDLocationCVCell")
        feedUICollectionView.register(UINib(nibName: "DDPostTitleCVCell", bundle: nil), forCellWithReuseIdentifier: "DDPostTitleCVCell")
        feedUICollectionView.register(UINib(nibName: "DDPostImageCVCell", bundle: nil), forCellWithReuseIdentifier: "DDPostImageCVCell")
        feedUICollectionView.register(UINib(nibName: "DDArticleCVCell", bundle: nil), forCellWithReuseIdentifier: "DDArticleCVCell")
        feedUICollectionView.register(UINib(nibName: "DDPollPercentCVCell", bundle: nil), forCellWithReuseIdentifier: "DDPollPercentCVCell")
    }
    
    
    private func setCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex,enviroment in
            switch sectionIndex {
            case 0 :
                return self?.postSection()
            case 3:
                return self?.articleSection()
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
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        
        return section
    }
    
    func articleSection() -> NSCollectionLayoutSection {
        // item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(4/5),
                heightDimension: .fractionalHeight(1)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        // group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(4/5),
                heightDimension: .estimated(140)
            ),
            subitem: item,
            count: 1
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
        
        // return
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
        if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDArticleCVCell", for: indexPath) as! DDArticleCVCell
            return cell
        } else {
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDFeedPostHeaderCVCell", for: indexPath) as! DDFeedPostHeaderCVCell
                return cell
                
            } else if indexPath.row == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDPostTitleCVCell", for: indexPath) as! DDPostTitleCVCell
                return cell
                
            } else if indexPath.row == 2 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDSeeMoreTextCVCell", for: indexPath) as! DDSeeMoreTextCVCell
                cell.populate(DDPostTextDataModel(), indexPath: indexPath)
                cell.delegate = self
                return cell
            } else if indexPath.row == 3 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDPostImageCVCell", for: indexPath) as! DDPostImageCVCell
                return cell
            } else if indexPath.row == 4 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDPollPercentCVCell", for: indexPath) as! DDPollPercentCVCell
                return cell
            } else if indexPath.row == 5 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDLocationCVCell", for: indexPath) as! DDLocationCVCell
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DDPostActionCVCell", for: indexPath) as! DDPostActionCVCell
                return cell
            }
        }
    }
    
}


extension DDFeedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = DDDemoController(settings: PageSettings())
               presentBottomSheet(viewController: vc)
        print(indexPath.row)
    }
}


extension DDFeedViewController: DDListViewDelegate {
    func reloadCellAtIndexPath(indexPath: IndexPath) {
        // feedUICollectionView.reloadItems(at: [indexPath])
    }
    
}


#if DEBUG
import SwiftUI


@available(iOS 13, *)
struct ProfileVCPreview: PreviewProvider {
    static var previews: some View {
        // Assuming your storyboard file name is "Main"
        UIStoryboard(name: "TabScreen", bundle: nil).instantiateViewController(identifier: "DDFeedViewController").toPreview()
    }
}
#endif
