//
//  DDFeedVM.swift
//  DoctorDemo
//
//  Created by Sanju on 24/09/23.
//


protocol DDSectionDataModel {
    var data: [DDListViewCellDataModel] { get set }
}


struct DDPostDataModel:DDListViewCellDataModel {
    var identifier: String = "DDSeeMoreTextCVCell"
    
}

struct DDFeedSectionDataModel: DDSectionDataModel {
    var data: [DDListViewCellDataModel] = []
    
    
}


class DDFeedVM {
    var data: [DDSectionDataModel] = []
    
    func addData() {
        let data1 = DDPostDataModel()
        let post1 = DDFeedSectionDataModel(data: [data1, data1, data1, data1, data1, data1, data1])
        data.append(post1)
        data.append(post1)
        data.append(post1)
        
        for _ in 0...10 {
            data.append(post1)
        }
    }
    
}
