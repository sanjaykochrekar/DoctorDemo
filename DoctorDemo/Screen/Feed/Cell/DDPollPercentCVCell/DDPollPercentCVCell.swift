//
//  DDPollPercentCVCell.swift
//  DoctorDemo
//
//  Created by Sanju on 26/09/23.
//

import UIKit

class DDPollPercentCVCell: UICollectionViewCell {
    
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var titleUILabel: UILabel!
    @IBOutlet weak var percentageUILabel: UILabel!
    @IBOutlet weak var percentWidthConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setData()
    }
    

    private func setData() {
        let randomData = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
        percentWidthConstraint.constant = (UIScreen.main.bounds.width - 30) * randomData.randomElement()!
        percentageUILabel.text = "30%"
    }

}
