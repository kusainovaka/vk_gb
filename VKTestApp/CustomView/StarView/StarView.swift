//
//  StarView.swift
//  VKTestApp
//
//  Created by Kamila on 20.01.2022.
//

import UIKit

class StarView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.red.cgColor)
        let path = getPath()

        context.addPath(path.cgPath)
        context.strokePath()
        
        let circleLayer = CAShapeLayer()
        circleLayer.backgroundColor = UIColor.red.cgColor
        circleLayer.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        circleLayer.position = CGPoint(x: 40, y: 20)
        circleLayer.cornerRadius = 10
        layer.addSublayer(circleLayer)

        let followPathAnimation = CAKeyframeAnimation(keyPath: "position")
        followPathAnimation.path = getPath().cgPath
        followPathAnimation.calculationMode = CAAnimationCalculationMode.paced
        followPathAnimation.speed = 0.1
        followPathAnimation.repeatCount = Float.infinity
        circleLayer.add(followPathAnimation, forKey: nil)
    }
    
    func getPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 40, y: 20))
        path.addLine(to: CGPoint(x: 45, y: 40))
        path.addLine(to: CGPoint(x: 65, y: 40))
        path.addLine(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 60, y: 70))
        path.addLine(to: CGPoint(x: 40, y: 55))
        path.addLine(to: CGPoint(x: 20, y: 70))
        path.addLine(to: CGPoint(x: 30, y: 50))
        path.addLine(to: CGPoint(x: 15, y: 40))
        path.addLine(to: CGPoint(x: 35, y: 40))
        path.close()
        path.stroke()
        return path
    }
}
