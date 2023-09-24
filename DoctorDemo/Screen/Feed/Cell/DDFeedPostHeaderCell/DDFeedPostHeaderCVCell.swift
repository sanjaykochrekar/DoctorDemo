//
//  DDFeedPostHeaderCVCell.swift
//  DoctorDemo
//
//  Created by Sanju on 23/09/23.
//

import UIKit

class DDFeedPostHeaderCVCell: UICollectionViewCell {
    @IBOutlet weak var categoryUILabel: UILabel!
    @IBOutlet weak var lastPostedTimeUILabel: UILabel!
    @IBOutlet weak var avatarUIImageView: UIImageView!
    @IBOutlet weak var userNameUIlabel: UILabel!
    @IBOutlet weak var createdWhatUILabel: UILabel!
    @IBOutlet weak var statusUILabel: UILabel!
    
    @IBOutlet weak var userSpecialityUIView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
