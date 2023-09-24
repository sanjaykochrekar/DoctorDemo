//
//  DDTableViewCell.swift
//  DoctorDemo
//
//  Created by Sanju on 19/09/23.
//

import Foundation


protocol DDListViewCell {
    func populate(_ data: DDListViewCellDataModel, indexPath: IndexPath?)
}

extension DDListViewCell {
}




protocol DDListViewCellDataModel {
    var identifier: String { get set }
}

protocol DDListViewDelegate {
    func reloadCellAtIndexPath(indexPath: IndexPath)
}

extension DDListViewDelegate {
    func reloadCellAtIndexPath(indexPath: IndexPath) {}
}
