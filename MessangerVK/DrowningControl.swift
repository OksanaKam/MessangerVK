//
//  DrowningControl.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 25.02.2022.
//

import UIKit

@IBDesignable

class DrowningControl: UIControl {

    @IBInspectable var isToggle: Bool = true
    
    @IBOutlet var switchView: UISwitch! {
        didSet {
            switchView.isOn = isToggle
        }
    }
    
    @IBAction func switchPress(_ sender: Any) {
        isToggle.toggle()
        sendActions(for: .valueChanged)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        let colorOne: CGColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        context.setFillColor(colorOne)
        
        context.saveGState()
        
        let colorRed: UIColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        context.setFillColor(colorRed.cgColor)
        
        if isToggle {
        let rectangleRed = CGRect(x: rect.width/2, y: rect.height/2, width: rect.height/4, height: rect.width/4)
        
        context.fill(rectangleRed)
        }
        
        context.move(to: CGPoint(x: rect.width/2, y: 0))
        context.addLine(to: CGPoint(x: rect.width/2, y: rect.height/2))
        context.addLine(to: CGPoint(x: 0, y: rect.height/2))
        
        context.closePath()
        context.setLineWidth(5)
        
        context.setStrokeColor(UIColor.yellow.cgColor)
        context.strokePath()
        
        context.restoreGState()
        
        let triangle = UIBezierPath()
        
        triangle.move(to: CGPoint(x: 0, y: rect.height/2))
        triangle.addLine(to: CGPoint(x: 0, y: rect.height))
        triangle.addLine(to: CGPoint(x: rect.width/2, y: rect.height))
        triangle.close()
        
        context.addPath(triangle.cgPath)
        context.fillPath()
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.7
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGesture()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGesture()
    }
    
    private func setupGesture() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(tapDouble))
        doubleTap.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTap)
        
        //let swipe = UISwipeGestureRecognizer(target: self, action: #selector(tapDouble))
       // swipe.direction = .right
       // addGestureRecognizer(swipe)
    }
    
    @objc private func tapDouble(_ tap: UITapGestureRecognizer) {
        print("Tap")
        isToggle.toggle()
        switchView.isOn = isToggle
        
        sendActions(for: .valueChanged)
    }
}
