//
//  ProfileDrawningControl.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 12.03.2022.
//

import UIKit

@IBDesignable

class ProfileDrawningControl: UIControl {
    
    @IBInspectable var shadowColor: UIColor? {
        set { layer.shadowColor = newValue!.cgColor }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color) }
            else { return nil
            }
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        set { layer.shadowRadius = newValue }
        get { return layer.shadowRadius }
    }
    
    @IBInspectable var shadowOpacity: Float {
        set { layer.shadowOpacity = newValue }
        get { return layer.shadowOpacity }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    
}
}
