//
//  PhotoImageViewController.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 12.04.2022.
//

import UIKit

class PhotoImageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var photoImage: UIImageView! {
        didSet {
            photoImage.isUserInteractionEnabled = true
        }
    }
    
    @IBOutlet var scrollView: UIScrollView!
    
    //var numOfPhotos: [UIImage?] = []
    var numOfPhotos = [PhotosAPI]()
    
    var photoIndex: Int = 0
    
    var interactiveAnimator: UIViewPropertyAnimator!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Фотографии"
        
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        photoImage.clipsToBounds = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemTeal.cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.cornerRadius = 20
        gradientLayer.frame = view.bounds
        
        view.layer.addSublayer(gradientLayer)
        
        view.addSubview(photoImage)
        
        photoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        photoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        photoImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        photoImage.heightAnchor.constraint(equalTo: photoImage.widthAnchor, multiplier: 1).isActive = true
    
        /*
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan))
                view.addGestureRecognizer(recognizer)
        photoImage.image = numOfPhotos[photoIndex]
         */
         
        /*
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(showPhotoViewContriller))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipeGestureRecognizer)
         */
        
    }
   
    /*
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
            
            switch recognizer.state {
            case .began:
                interactiveAnimator?.startAnimation()
                interactiveAnimator = UIViewPropertyAnimator(
                    duration: 0.5,
                    curve: .easeInOut,
                    animations: {
                        self.photoImage.alpha = 0.5
                        self.photoImage.transform = .init(scaleX: 0.8, y: 0.8)
                })
                interactiveAnimator.pauseAnimation()
                
            case .changed:
                let translation = recognizer.translation(in: self.view)
                interactiveAnimator.fractionComplete = abs(translation.x / 100)
                self.photoImage.transform = CGAffineTransform(translationX: translation.x, y: 0)
                
            case .ended:
                interactiveAnimator.stopAnimation(true)
                if recognizer.translation(in: self.view).x < 0 {
                    if  photoIndex < numOfPhotos.count - 1  {
                        self.photoIndex += 1
                    }
                } else {
                    if photoIndex != 0 {
                        self.photoIndex -= 1
                    }
                }
                interactiveAnimator.addAnimations {
                    self.photoImage.transform = .identity
                    self.photoImage.alpha = 1
                }
                interactiveAnimator?.startAnimation()
                
            default: break
            }
            photoImage.image = numOfPhotos[photoIndex]
        }
    */
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "idUnwind" {
            guard segue.destination is PhotoViewController else { return }
        }
    }
    
    @objc func showPhotoViewContriller() {
        self.performSegue(withIdentifier: "idUnwind", sender: self)
    }
     */
}
