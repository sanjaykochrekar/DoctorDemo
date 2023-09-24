//
//  DDSeeMoreTextCVCell.swift
//  DoctorDemo
//
//  Created by Sanju on 24/09/23.
//

import UIKit

class DDSeeMoreTextCVCell: UICollectionViewCell {
    @IBOutlet weak var textUILabel: UILabel!
    
    let msg = "My husband has his 3 days transplant assessment in Newcastle next month, strange mix of emotions. For those that have been through this how long did it take following assessment was it until you were t... See More"
    
    let msg2 = "My husband has his 3 days transplant assessment in Newcastle next month, strange mix of emotions. For those that have been through this how long did it take following assessment was it until you were My husband has his 3 days transplant assessment in Newcastle next month, strange mix of emotions. For those that have been through this how long did it take following assessment was it until you were"
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        setText(text: msg)
    }
    
    
    private func setText(text: String) {
        textUILabel.text = text
        self.textUILabel.textColor =  UIColor.appColor(.dark75)
        
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "... See More")

        underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont.appFont(weight: .bold, size: 14), range: range1)

        textUILabel.attributedText = underlineAttriString
        textUILabel.isUserInteractionEnabled = true
        textUILabel.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
    }
    
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        let text = msg
        let termsRange = (text as NSString).range(of: "... See More")
        // comment for now
        let privacyRange = (text as NSString).range(of: "Privacy Policy")
        
        if gesture.didTapAttributedTextInLabel(label: textUILabel, inRange: termsRange) {
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.setText(text: self?.msg2 ?? "")
            }
            print("Tapped terms")
        } else if gesture.didTapAttributedTextInLabel(label: textUILabel, inRange: privacyRange) {
            print("Tapped privacy")
        } else {
            print("Tapped none")
        }
    }
}
