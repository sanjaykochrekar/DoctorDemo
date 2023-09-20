//
//  DDTableViewCell.swift
//  DoctorDemo
//
//  Created by Sanju on 19/09/23.
//


protocol DDTableViewCell {
    func populate(_ data: DDTableViewCellDataModel)
}


protocol DDTableViewCellDataModel {
    var identifier: String { get set }
}
