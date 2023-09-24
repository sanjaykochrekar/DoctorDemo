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
    }
    
}

extension FabTableViewCell: DDListViewCell {
    
    func populate(_ data: DDListViewCellDataModel) {
        if let data = data as? DDFabCellDataModel {
            iconUIImage.image = UIImage(name: data.image)
            titleUILabel.text = data.title
            descriptionUILabel.text = data.description
        }
    }
    
}
