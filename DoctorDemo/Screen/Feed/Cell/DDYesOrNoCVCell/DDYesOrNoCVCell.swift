//
//  DDYesOrNoCVCell.swift
//  DoctorDemo
//
//  Created by Sanju on 03/10/23.
//

import UIKit

class DDYesOrNoCVCell: UICollectionViewCell {
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var votedBy: UILabel!
    @IBOutlet weak var yesUIButton: UIButton!
    @IBOutlet weak var noUIButton: UIButton!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
