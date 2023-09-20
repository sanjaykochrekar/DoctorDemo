//
//  Image+Extension.swift
//  DoctorDemo
//
//  Created by Sanju on 18/09/23.
//

import UIKit



extension UIImage {
    convenience init?(name: DDImageName) {
        self.init(named: name.rawValue, in: nil, with: nil)
    }
}
