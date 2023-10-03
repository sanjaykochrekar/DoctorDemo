//
//  DDFeedVM.swift
//  DoctorDemo
//
//  Created by Sanju on 24/09/23.
//


struct DDPostDataModel {
    var celldata: [DDListViewCellDataModel]
    
    init() {
        celldata = []
    }
    
    init(celldata: [DDListViewCellDataModel]) {
        self.celldata = celldata
    }
    
    
    mutating func append(_ element: DDListViewCellDataModel) {
        celldata.append(element)
    }
    
}


class DDFeedVM {
    var data: [DDPostDataModel] = []
    
    func addData() {
        loadData()
    }
    
    func loadData() {
        if let d = DemoFunction.loadPost() {
            let postinator = DDPostinator(data: d)
            data = postinator.getFeedData()
        }
        print("---------------------------------")
        print(data)
        print("---------------------------------")
    }
    
    
    func getFeedData() -> [DDPostDataModel] {
        let postHeaderCell = DDPostHeaderDataModel(userName: "Sanju")
        let postQuestionCell = DDPostTitleDataModel(title: "Once opon time in bengaluru")
        let imageCell = DDPostImageDataModel()
        let footerCell = DDPostFooterDataModel(reaction: 23, comments: 12, isBookMarked: false)
        let post = DDPostDataModel(celldata: [postHeaderCell, postQuestionCell, imageCell, footerCell])
        return [post, post, post, post]
    }
    
}
