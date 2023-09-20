//
//  Font+Extension.swift
//  Expense tracker
//
//  Created by Sanju on 09/09/23.
//

import UIKit



enum ETFontName: String {
    case inter = "Inter"
}


enum DDFontWeight: String {
    case black = "Black"
    case bold = "Bold"
    case extraBold = "ExtraBold"
    case extraLight = "ExtraLight"
    case light = "Light"
    case medium = "Medium"
    case regular = "Regular"
    case semiBold = "SemiBold"
    case thin = "Thin"
}


extension UIFont {
    
    static func appFont(name: ETFontName = .inter, weight: DDFontWeight = .regular, size: CGFloat = 16) -> UIFont {
        return UIFont(name: "\(name.rawValue)-\(weight.rawValue)", size: size)!
    }
    
}
