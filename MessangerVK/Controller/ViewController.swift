//
//  ViewController.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 14.02.2022.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    
    @IBOutlet var webview: WKWebView! 
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var VKFullLogo: UIImageView!
    @IBOutlet weak var Login: UILabel!
    @IBOutlet weak var Password: UILabel!
    @IBOutlet weak var fieldForLogin: UITextField!
    @IBOutlet weak var fieldForPassword: UITextField!
    @IBOutlet weak var enter: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var firstTime: UILabel!
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var enterFacebook: UIButton!
    
    //@IBOutlet var viewDots: UIView! // выдавал ошибку, разобраться
    
    //let replicator = CAReplicatorLayer()
    //let dot = CALayer()
    //let dot1 = CALayer()
    //let dot2 = CALayer()
    //let dotLength: CGFloat = 20.0
    
    @IBAction func registerPush(_ sender: Any) {
        print("пользователь нажал на кнопку")
        /*
        guard let login = fieldForLogin.text,
              let password = fieldForPassword.text,
              login == "",
              password == "" else {
                  show(message: "Error password")
                  return
              }
         */
    }
    @IBAction func enterFacebookPush(_ sender: Any) {
        print("пользователь нажал на кнопку")
    }
    @IBAction func enterPush(_ sender: Any) {
        print("пользователь нажал на кнопку")
        
        guard let login = fieldForLogin.text,
              let password = fieldForPassword.text,
              login == "",
              password == "" else {
                  show(message: "Error password")
                  return
              }
    }
    
    @IBAction func forgotPasswordPush(_ sender: Any) {
        print("пользователь нажал на кнопку")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideScreen))
        view.addGestureRecognizer(tapGR)
        /*
        replicator.frame = viewDots.bounds
        view.layer.addSublayer(replicator)
        
        dot.frame = CGRect(
            x: viewDots.center.x - dotLength,
            y: viewDots.center.y,
        width: dotLength, height: dotLength)
        dot.cornerRadius = dotLength / 2.0
        
        dot1.frame = CGRect(
            x: viewDots.center.x - dotLength - 35,
            y: viewDots.center.y,
        width: dotLength, height: dotLength)
        dot1.cornerRadius = dotLength / 2.0
        
        dot2.frame = CGRect(
            x: viewDots.center.x - dotLength + 35,
            y: viewDots.center.y,
        width: dotLength, height: dotLength)
        dot2.cornerRadius = dotLength / 2.0
        
        replicator.addSublayer(dot)
        replicator.addSublayer(dot1)
        replicator.addSublayer(dot2)
    
        let tint = CABasicAnimation(keyPath: "backgroundColor")
        tint.fromValue = UIColor.systemTeal.cgColor
        tint.toValue = UIColor.clear.cgColor
        tint.duration = 0.5
        tint.beginTime = CACurrentMediaTime()
        tint.fillMode = .backwards
        tint.repeatCount = .infinity
        tint.autoreverses = true
        tint.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        dot.add(tint, forKey: "dotColor")
        
        _ = CABasicAnimation(keyPath: "backgroundColor")
        tint.fromValue = UIColor.systemTeal.cgColor
        tint.toValue = UIColor.clear.cgColor
        tint.duration = 0.5
        tint.beginTime = CACurrentMediaTime() + 0.6
        tint.fillMode = .backwards
        tint.repeatCount = .infinity
        tint.autoreverses = true
        tint.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        dot1.add(tint, forKey: "dotColor")
        
        _ = CABasicAnimation(keyPath: "backgroundColor")
        tint.fromValue = UIColor.systemTeal.cgColor
        tint.toValue = UIColor.clear.cgColor
        tint.duration = 0.5
        tint.beginTime = CACurrentMediaTime() + 1.1
        tint.fillMode = .backwards
        tint.repeatCount = .infinity
        tint.autoreverses = true
        tint.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        dot2.add(tint, forKey: "dotColor")
        */
        
        //view.addSubview(viewDots)     // выдавал ошибку, разобраться
        //drowLogo()                    // пока убрала анимацию логотипа
    }
    /*
    private func drowLogo() {
        
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 89.2, y: 107))
        bezier2Path.addCurve(to: CGPoint(x: 8.1, y: 14.6), controlPoint1: CGPoint(x: 38.33, y: 107), controlPoint2: CGPoint(x: 9.31, y: 72.32))
        bezier2Path.addLine(to: CGPoint(x: 33.58, y: 14.6))
        bezier2Path.addCurve(to: CGPoint(x: 68.09, y: 78.6), controlPoint1: CGPoint(x: 34.42, y: 56.96), controlPoint2: CGPoint(x: 53.21, y: 74.91))
        bezier2Path.addLine(to: CGPoint(x: 68.09, y: 14.6))
        bezier2Path.addLine(to: CGPoint(x: 92.08, y: 14.6))
        bezier2Path.addLine(to: CGPoint(x: 92.08, y: 51.13))
        bezier2Path.addCurve(to: CGPoint(x: 127.42, y: 14.6), controlPoint1: CGPoint(x: 106.78, y: 49.56), controlPoint2: CGPoint(x: 122.21, y: 32.91))
        bezier2Path.addLine(to: CGPoint(x: 151.42, y: 14.6))
        bezier2Path.addCurve(to: CGPoint(x: 118.77, y: 60.66), controlPoint1: CGPoint(x: 147.42, y: 37.17), controlPoint2: CGPoint(x: 130.68, y: 53.82))
        bezier2Path.addCurve(to: CGPoint(x: 157, y: 107), controlPoint1: CGPoint(x: 130.68, y: 66.21), controlPoint2: CGPoint(x: 149.75, y: 80.73))
        bezier2Path.addLine(to: CGPoint(x: 130.59, y: 107))
        bezier2Path.addCurve(to: CGPoint(x: 92.08, y: 73.98), controlPoint1: CGPoint(x: 124.91, y: 89.43), controlPoint2: CGPoint(x: 110.78, y: 75.83))
        bezier2Path.addLine(to: CGPoint(x: 92.08, y: 107))
        bezier2Path.addLine(to: CGPoint(x: 89.2, y: 107))
        bezier2Path.close()
        
        let layer = CAShapeLayer()
        layer.frame = viewDots.frame
        layer.path = bezier2Path.cgPath
        layer.lineWidth = 3
        layer.strokeColor = UIColor.systemTeal.cgColor
        layer.fillColor = UIColor.blue.cgColor
        
        layer.strokeEnd = 1
        layer.strokeStart = 0
        
        let strokeEndAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.toValue = 1
        
        let strokeStartAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeStart))
        strokeStartAnimation.fromValue = -0.25
        strokeStartAnimation.toValue = 0.75
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [strokeEndAnimation, strokeStartAnimation]
        animationGroup.duration = 5
        animationGroup.repeatCount = .infinity
        
        layer.add(animationGroup, forKey: nil)
        
        viewDots.layer.addSublayer(layer)
    }
     */

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    }
    
    @objc func willShowKeyboard(_ notification: Notification) {
        
        guard let info = notification.userInfo as NSDictionary?,
              let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
        
        let keyBoardHeight = keyboardSize.cgRectValue.size.height
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyBoardHeight, right: 0)
    }
    
    @objc func willHideKeyboard(_ notification: Notification) {
        print(#function)
        
        guard let info = notification.userInfo as NSDictionary?,
              let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
        
        let keyBoardHeight = keyboardSize.cgRectValue.size.height
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -keyBoardHeight, right: 0)
    }
    
    @objc func hideScreen() {
        view.endEditing(true)
}
}


