//
//  DDPostTextDataModel.swift
//  DoctorDemo
//
//  Created by Sanju on 24/09/23.
//

import UIKit


struct DDPostHeaderDataModel: DDListViewCellDataModel {
    var identifier: String = "DDFeedPostHeaderCVCell"
    
    var image: UIImage?
    var userName: String
    var postType: String?
    var userType: String?
    var userStatus: String?
}


struct DDPostTitleDataModel: DDListViewCellDataModel {
    var identifier: String = "DDPostTitleCVCell"
    
    var title: String
}


struct DDSeeMoreTextDataModel: DDListViewCellDataModel {
    var identifier: String = "DDSeeMoreTextCVCell"
    
    var text: String
}


struct DDPostImageDataModel: DDListViewCellDataModel {
    var identifier: String = "DDPostImageCVCell"
    
    var image: [UIImage] = []
}


struct DDPostPollItemDataModel: DDListViewCellDataModel {
    var identifier: String = "DDPollPercentCVCell"
    
    var title: String
    var percent: Double?
}


struct DDPostLocationDataModel: DDListViewCellDataModel {
    var identifier: String = "DDLocationCVCell"
    
    var loaction: String?
}


struct DDPostFooterDataModel: DDListViewCellDataModel {
    var identifier: String = "DDPostActionCVCell"
    
    var image: [UIImage] = []
    var reaction: Int
    var comments: Int
    var isBookMarked: Bool
}


struct DDFeedArticleDataModel: DDListViewCellDataModel {
    var identifier: String = "DDArticleCVCell"
    
    var profilePic: UIImage?
    var userName: String
    var text: String?
}
