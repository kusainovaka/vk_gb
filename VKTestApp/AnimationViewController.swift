//
//  AnimationViewController.swift
//  VKTestApp
//
//  Created by Kamila on 02.02.2022.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        animationOne()
//        animationOneKey()
//        animationGroup()
        animationBezier()
    }
    
    func animationOne() {
        UIView.animate(withDuration: 0.5, animations: {
            self.nameLabel.center.x += 200
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.nameLabel.center.y += 100
            }, completion: { _ in
                UIView.animate(withDuration: 0.5, animations: {
                    self.nameLabel.center.x -= 200
                }, completion: { _ in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.nameLabel.center.y -= 100
                    })
                })
            })
        })
    }
    
    func animationOneKey() {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.nameLabel.center.x += 200
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.nameLabel.center.y += 100
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.nameLabel.center.x -= 200
            })
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.nameLabel.center.y -= 100
            })
        }, completion: nil)
    }
    
    func animationGroup() {
        let animationGroups = CAAnimationGroup()
        animationGroups.duration = 0.5
        animationGroups.fillMode = CAMediaTimingFillMode.backwards
        
        let translation = CABasicAnimation(keyPath: "position.x")
        translation.toValue = 100
        let alpha = CABasicAnimation(keyPath: "opacity")
        alpha.toValue = 0
        
        animationGroups.animations = [translation, alpha]
        nameLabel.layer.add(animationGroups, forKey: nil)
    }
    
    func animationBezier() {
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1
        
        let strokeStartAnimation =  CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.fromValue = 0
        strokeStartAnimation.toValue = 1

        let strokeEndAnimation =  CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.toValue = 1.2
        
        let animationGroups = CAAnimationGroup()
        animationGroups.duration = 2
        animationGroups.animations = [strokeStartAnimation, strokeEndAnimation]
        nameLabel.layer.add(animationGroups, forKey: nil)
    }
}
