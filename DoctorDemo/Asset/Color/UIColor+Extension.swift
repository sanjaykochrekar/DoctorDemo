//
//  UIColor+Extension.swift
//  DoctorDemo
//
//  Created by Sanju on 18/09/23.
//

import UIKit




extension UIColor {
    
    static func appColor(_ color: DDColor, opacity: Double = 1.0) -> UIColor {
        let color:UIColor = UIColor(named: color.rawValue) ?? .clear
        return color.withAlphaComponent(opacity)
    }
    
}

