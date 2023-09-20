//
//  FabTableViewCell.swift
//  DoctorDemo
//
//  Created by Sanju on 19/09/23.
//

import UIKit

class FabTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconUIImage: UIImageView!
    @IBOutlet weak var titleUILabel: UILabel!
    @IBOutlet weak var descriptionUILabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension FabTableViewCell: DDTableViewCell {
    func populate(_ data: DDTableViewCellDataModel) {
        if let data = data as? DDFabCellDataModel {
            iconUIImage.image = UIImage(name: data.image)
            titleUILabel.text = data.title
            descriptionUILabel.text = data.description
        }
    }
    
}
