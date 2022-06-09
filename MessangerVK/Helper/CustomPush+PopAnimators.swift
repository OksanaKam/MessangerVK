//
//  CustomPush+PopAnimators.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 19.04.2022.
//

import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let animationDuration: TimeInterval = 1
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        
        let sourceViewFrame = CGRect(x: -containerViewFrame.height, y: 0, width: source.view.frame.height, height: source.view.frame.width)
        let destinationViewFrame = source.view.frame
        
        destination.view.transform = CGAffineTransform(rotationAngle: -(.pi/2))
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.transform = CGAffineTransform(rotationAngle: .pi/2)
        destination.view.frame = CGRect(x: containerViewFrame.width, y: 0, width: source.view.frame.height, height: source.view.frame.width)
        
        UIView.animate(withDuration: animationDuration,
                       animations: {
            source.view.transform = CGAffineTransform(rotationAngle: .pi/2)
            source.view.frame = sourceViewFrame
            destination.view.transform = .identity
            destination.view.frame = destinationViewFrame
        }) { finished in
            transitionContext.completeTransition(finished)
        }
    }
}

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let animationDuration: TimeInterval = 1
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        
        let sourceViewFrame = CGRect(x: containerViewFrame.width, y: 0, width: source.view.frame.height, height: source.view.frame.width)
        let destinationViewFrame = source.view.frame
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = CGRect(x: -containerViewFrame.height, y: 0, width: source.view.frame.height, height: source.view.frame.width)
        
        UIView.animate(withDuration: animationDuration,
                       animations: {
            source.view.frame = sourceViewFrame
            source.view.transform = CGAffineTransform(rotationAngle: -.pi/2)
            destination.view.transform = .identity
            destination.view.frame = destinationViewFrame
        }) { finished in
            transitionContext.completeTransition(finished)
            
        }
    }
}

class ShowPhotoAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let animationDuration = 1.0
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return 1
        }
        
        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            
          /*
            guard let source = transitionContext.viewController(forKey: .from),
                let destination = transitionContext.viewController(forKey: .to) else { return }
            
            let containerViewFrame = transitionContext.containerView.frame
            source.view.frame = containerViewFrame
            destination.view.frame = containerViewFrame
            destination.view.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            
            UIView.animate(withDuration: animationDuration, animations: {
                destination.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                destination.view.transform = .identity
            }) { completed in
                transitionContext.completeTransition(true)
            }
          */
        }
}

