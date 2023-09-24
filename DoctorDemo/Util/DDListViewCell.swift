//
//  DDTableViewCell.swift
//  DoctorDemo
//
//  Created by Sanju on 19/09/23.
//

import Foundation


protocol DDListViewCell {
    func populate(_ data: DDListViewCellDataModel)
    func populate(_ data: DDListViewCellDataModel, indexPath: IndexPath)
}


protocol DDListViewCellDataModel {
    var identifier: String { get set }
}
