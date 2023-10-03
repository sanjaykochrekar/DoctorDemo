//
//  DDPostinator.swift
//  DoctorDemo
//
//  Created by Sanju on 30/09/23.
//

import Foundation


// MARK: - DDPostinator

struct DDPostinator {
    private var data: Data
    private var postData: DDFeed = []
    
    init(data: Data) {
        self.data = data
        decodeJson()
    }
    
    mutating func decodeJson() {
        do {
            let decoder = JSONDecoder()
            postData = try decoder.decode(DDFeed.self, from: data)
        } catch {
            
        }
    }
    
    func getFeedData() -> [DDPostDataModel] {
        var list: [DDPostDataModel] = []
        
        for (_, item)in postData.enumerated() {
            var postModel = DDPostDataModel()
            let headerCell = DDPostHeaderDataModel(userName: item.id)
            postModel.append(headerCell)
            
            let question = DDPostTitleDataModel(title: "abcdefg")
            postModel.append(question)
            
            let image = DDPostImageDataModel()
            postModel.append(image)
            
            let footer = DDPostFooterDataModel(reaction: 24, comments: 12, isBookMarked: true)
            postModel.append(footer)
            
            
            list.append(postModel)
        }
        return list
    }
}



// MARK: - DDFeed
typealias DDFeed = [DDPost]



// MARK: - WelcomeElement
struct DDPost: Decodable {
    let id, category: String
    let user: User
    let myReaction, question, description: String
    let location: Location
    let likeCount, commentCount: Int
    let isBookmarked: Bool
    let reactionCount: Int
    let reactPreview: [ReactPreview]
    let postedDateAndTime, postType: String
    let comments: [Comment]

    enum CodingKeys: String, CodingKey {
        case id, category, user
        case myReaction = "my_reaction"
        case question, description, location
        case likeCount = "like_count"
        case commentCount = "comment_count"
        case isBookmarked = "is_bookmarked"
        case reactionCount = "reaction_count"
        case reactPreview = "react_preview"
        case postedDateAndTime = "posted_date_and_time"
        case postType = "post_type"
        case comments
    }
}



// MARK: - Comment
struct Comment: Decodable {
    let postedBy, postedOn, description: String
    let imageURL: [String]
    let type: String

    enum CodingKeys: String, CodingKey {
        case postedBy = "posted_by"
        case postedOn = "posted_on"
        case description
        case imageURL = "image_url"
        case type
    }
}



// MARK: - Location
struct Location: Decodable {
    let place, subPlace, city, country: String

    enum CodingKeys: String, CodingKey {
        case place
        case subPlace = "sub_place"
        case city, country
    }
}



// MARK: - ReactPreview
struct ReactPreview: Decodable {
    let profileURL: [String]
    let reaction: String

    enum CodingKeys: String, CodingKey {
        case profileURL = "profile_url"
        case reaction
    }
}



// MARK: - User
struct User: Decodable {
    let name, profilePicURL, userType: String

    enum CodingKeys: String, CodingKey {
        case name
        case profilePicURL = "profile_pic_url"
        case userType = "user_type"
    }
}

