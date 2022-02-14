//
//  AnimationPartThreeViewController.swift
//  VKTestApp
//
//  Created by Kamila on 03.02.2022.
//

import UIKit

class AnimationPartThreeViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    private var isTaped = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        viewAnimation()
//        keyFrameAnimation()
//        circleAnimation()
//        setInitialViewTransform()
//        addGestureAction()
        propertyAnimation()
    }
}

private extension AnimationPartThreeViewController {
    
    func viewAnimation() {
        UIView.animate(withDuration: 1, animations: {
            self.nameLabel.frame.origin.x += 200
        }, completion: { _ in
            UIView.animate(withDuration: 1, animations: {
                self.nameLabel.frame.origin.y += 100
            }, completion: { _ in
                UIView.animate(withDuration: 1, animations: {
                    self.nameLabel.frame.origin.x -= 200
                }, completion: { _ in
                    UIView.animate(withDuration: 1, animations: {
                        self.nameLabel.frame.origin.y -= 100
                    })
                })
            })
        })
    }
    
    func keyFrameAnimation() {
        UIView.animateKeyframes(withDuration: 2, delay: 0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.nameLabel.frame.origin.x += 200
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.nameLabel.frame.origin.y += 100
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration:
                                0.25, animations: {
                self.nameLabel.frame.origin.x -= 200
            })
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.nameLabel.frame.origin.y -= 100
            })
        })
    }
    
    func addGroupAnimation() {
        let group = CAAnimationGroup()
        group.duration = 2
        group.fillMode = .backwards
        
        let alpha = CABasicAnimation(keyPath: "opacity")
        alpha.toValue = 0
        
        let translation = CABasicAnimation(keyPath: "position.x")
        translation.fromValue = 300
        
        group.animations = [alpha, translation]
        nameLabel.layer.add(group, forKey: nil)
    }
    
    func beizherPathAnimation() {
        let animationStart = CABasicAnimation(keyPath: "strokeStart")
        animationStart.fromValue = 0
        animationStart.toValue = 1

        let animationEnd = CABasicAnimation(keyPath: "strokeEnd")
        animationEnd.fromValue = 0
        animationEnd.toValue = 1.2
        
        let animationGroup = CAAnimationGroup()
        animationGroup.beginTime = CACurrentMediaTime()
        animationGroup.duration = 2
        animationGroup.repeatCount = 3
        animationGroup.autoreverses = true
        animationGroup.animations = [animationStart, animationEnd]
        
        let testView = UIView(frame: .init(x: 100, y: 200, width: 20, height: 40))
        testView.backgroundColor = .red
        view.addSubview(testView)
        
        testView.layer.add(animationStart, forKey: "strokeStart")
    }
    
    func circleAnimation() {
        let starView = StarView()
        starView.frame = CGRect(x: 10, y: 300, width: 100, height: 100)
        view.addSubview(starView)
    }
    
    func setInitialViewTransform() {
        let rotation = CATransform3DMakeRotation(.pi, 0, 1, 0)
        let scale = CATransform3DScale(CATransform3DIdentity, 0.8, 0.8, 0)
        let transform = CATransform3DConcat(scale, rotation)
        
        nameLabel.transform = CATransform3DGetAffineTransform(transform)
    }
    
    func addGestureAction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnView))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTapOnView() {
        UIView.animate(withDuration: 1, animations: {
            if self.isTaped {
                self.setInitialViewTransform()
            } else {
                self.nameLabel.transform = .identity
            }
        }, completion: { _ in
            self.isTaped.toggle()
        })
    }
    
    func propertyAnimation() {
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.nameLabel.frame = self.nameLabel.frame.offsetBy(dx: 0, dy: 100)
        }
        animator.startAnimation()
    }
    
}
