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
        return vm.data[section].celldata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellData = vm.data[indexPath.section].celldata[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellData.identifier, for: indexPath)
        
        return cell
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
