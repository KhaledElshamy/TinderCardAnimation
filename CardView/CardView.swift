//
//  CardView.swift
//  CardView
//
//  Created by Khaled Elshamy on 6/12/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit

class CardView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    fileprivate var shouldCarDismiss = true
    
    fileprivate let  image = UIImageView()
    
    
    init(image:UIImage) {
        super.init(frame: .zero)
        self.image.image = image
        
        clipsToBounds  = true
        layer.cornerRadius = 10

        addSubview(self.image)
        self.image.fillSuperview()

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        clipsToBounds  = true
//        layer.cornerRadius = 10
//
//        addSubview(image)
//        image.fillSuperview()
//
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
//        addGestureRecognizer(panGesture)
//    }
    
    
    
    @objc fileprivate func handlePan(gesture:UIPanGestureRecognizer){
        
        switch gesture.state {
        case .changed:
             handleChange(gesture)
        case .ended:
            handleEnd(gesture)
        default:
            ()
        }
    }
    
    
    fileprivate func handleChange(_ gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: nil)
        let degree: CGFloat = translation.x / 20
        let angle = degree * .pi / 180
        
//        print(translation.x)
        let rationalTransition = CGAffineTransform(rotationAngle: angle)
        self.transform = rationalTransition.translatedBy(x: translation.x, y: translation.y)
    }
    
    fileprivate func handleEnd(_ gesture: UIPanGestureRecognizer) {
         
        let translation = gesture.translation(in: nil)
        let threshold = translation.x
        
        let translationDiretion:CGFloat = threshold > 0 ? 1 : -1
        
        if threshold > 150 || threshold < -150 {
            self.shouldCarDismiss = true
        }else {
            self.shouldCarDismiss = false
        }
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            
            if self.shouldCarDismiss {
                let offScreentransform = self.transform.translatedBy(x: 1000 * translationDiretion, y: 0)
                self.transform = offScreentransform
            }else {
                self.transform = .identity
            }
            
        }) { (_) in
//            self.transform = .identity

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
