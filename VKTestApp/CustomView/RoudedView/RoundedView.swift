//
//  RoundedView.swift
//  VKTestApp
//
//  Created by Kamila on 21.01.2022.
//

import UIKit

@IBDesignable class RoundedView: UIView {
    
    @IBInspectable var roundSize: CGFloat = 60 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.red.cgColor)
        let size = roundSize * 2
        context.fillEllipse(in: .init(x: rect.midX - roundSize, y: rect.midY - roundSize, width: size, height: size))
    }
}
