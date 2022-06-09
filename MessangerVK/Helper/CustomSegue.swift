//
//  CustomSegue.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 19.04.2022.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    private let animationDuration = 1.0
    
    override func perform() {
        
                //destination.transitioningDelegate = self
                //super.perform()
        /*
        var originFrame = CGRect.zero
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        containerView.addSubview(toView)
        toView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(
          withDuration: animationDuration,
          animations: {
            toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
          },
          completion: { _ in
            transitionContext.completeTransition(true)
          }
        )
        */
        
        guard let containerView = source.view else { return }
        
        containerView.addSubview(destination.view)
        source.view.frame = containerView.frame
        destination.view.frame = containerView.frame
        
        destination.view.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        //destination.view.transform = CGAffineTransform(translationX: 0, y: -source.view.bounds.height)
        
        UIView.animate(withDuration: animationDuration,
                       animations: {
            self.destination.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: { _ in
            self.source.present(self.destination, animated: false)
        })
         
        /*
        UIView.animate(withDuration: animationDuration, animations: {
            self.destination.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            //self.destination.view.transform = .identity
        }) { completed in
            self.source.present(self.destination, animated: false)
        }
         */
    }
}

class UnwindCustomSegue: UIStoryboardSegue {
    private let animationDuration = 1.0
    
    override func perform() {
        
        /*
        var originFrame = CGRect.zero
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        containerView.addSubview(toView)
        toView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(
          withDuration: duration,
          animations: {
            toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
          },
          completion: { _ in
            transitionContext.completeTransition(true)
          }
        )
        */
        guard let containerView = source.view else { return }
        
        containerView.addSubview(destination.view)
        source.view.frame = containerView.frame
        destination.view.frame = containerView.frame
        
        //destination.view.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        destination.view.superview?.insertSubview(destination.view, at: 0)
        
        //destination.view.transform = CGAffineTransform(translationX: 0, y: -source.view.bounds.height)
        
        UIView.animate(withDuration: animationDuration,
                       animations: {
            self.destination.view.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        }, completion: { _ in
            self.source.dismiss(animated: false, completion: nil)
        })
        /*
        UIView.animate(withDuration: animationDuration, animations: {
            self.destination.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            //self.destination.view.transform = .identity
        }) { completed in
            self.source.present(self.destination, animated: false)
        }
         */
    }
}

/*
extension CustomSegue: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return ShowPhotoAnimator()
    }
}
*/
