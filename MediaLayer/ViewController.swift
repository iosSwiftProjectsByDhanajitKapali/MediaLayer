//
//  ViewController.swift
//  MediaLayer
//
//  Created by unthinkable-mac-0025 on 02/06/21.
//

import UIKit
import TheAnimation

class ViewController: UIViewController {

    let layer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //creating a layer
        layer.backgroundColor = UIColor.systemRed.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        view.layer.addSublayer(layer)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
            self.animateOpacity()
            self.animateRotate()
            self.animateMovement()
        }
    }
    func animateRotate()  {
        let animation = BasicAnimation(keyPath: .transformRotationZ)
        animation.fromValue = 0
        animation.toValue = .pi/2
        animation.duration = 2
        animation.fillMode = .forwards      //should animation revert back
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
//        layer.add(animation, forKey: nil)
        
    }
    
    func animateMovement()  {
        let animation = BasicAnimation(keyPath: .position)
        animation.fromValue = CGPoint(x: layer.frame.origin.x + (layer.frame.size.width/2), y: layer.frame.origin.y + (layer.frame.size.width/2))
        animation.toValue = CGPoint(x: 300, y: 400)
        animation.duration = 2
        animation.timingFunction = .easeInEaseOut
        animation.fillMode = .forwards      //should animation revert back
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
        
        
    }
    
    func animateOpacity()  {
        let animation = BasicAnimation(keyPath: .opacity)
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 2
        animation.fillMode = .backwards      //should animation revert back
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
        
    }


}

