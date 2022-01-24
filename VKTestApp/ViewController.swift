//
//  ViewController.swift
//  VKTestApp
//
//  Created by Kamila on 05.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addStarView()
        addGradient()
        addCustomView()
        addGesture()
//        addSwitchController()
        addButton()
//        addTransorm()
    }

    @IBAction func didTapOnLogin(_ sender: Any) {
        print("didTapOnLogin")
    }
}

private extension ViewController {
    func addStarView() {
        let starView = StarView(frame: CGRect(x: 100, y: 50, width: 150, height: 150))
        starView.backgroundColor = .green
        view.addSubview(starView)
    }
    
    func addCustomView() {
        let size: CGFloat = 150
        let customView = CustomView(frame: CGRect(x: 100, y: 50, width: size, height: size))
        customView.backgroundColor = .white
//        customView.clipsToBounds = true
        // MARK: - Layer
//        customView.layer.cornerRadius = 15// круг = size / 2
//        customView.layer.borderWidth = 2
//        customView.layer.borderColor = UIColor.red.cgColor
        
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOffset = .zero
        customView.layer.shadowOpacity = 0.8 // (0 - 1)
        customView.layer.shadowRadius = 15
        
        view.addSubview(customView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnCustomView))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTapOnCustomView() {
        print("Hello 👀👀👀👀👀")
    }
    
    func addGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.red.cgColor, UIColor.green.cgColor]
        gradient.locations = [0 as NSNumber, 1 as NSNumber]
        gradient.startPoint = .zero
        gradient.endPoint = CGPoint(x: 0, y: 1)

        view.layer.addSublayer(gradient)
        gradient.frame = view.bounds
    }
    
    func addTransorm() {
        let translation = CGAffineTransform(translationX: 10, y: 20)
        let scale = CGAffineTransform(scaleX: 1.5, y: 1.5)
        let rotation = CGAffineTransform(rotationAngle: .pi / 4)
        
        let size: CGFloat = 150
        let oneView = UIView(frame: .init(x: 0, y: 100, width: size, height: size))
        oneView.backgroundColor = .blue
        oneView.transform = translation
        view.addSubview(oneView)
        
        let twoView = UIView(frame: .init(x: 200, y: 200, width: size, height: size))
        twoView.backgroundColor = .gray
        twoView.transform = scale
        view.addSubview(twoView)
        
        let threeView = UIView(frame: .init(x: 0, y: 600, width: size, height: size))
        threeView.backgroundColor = .orange
        threeView.transform = rotation
        view.addSubview(threeView)
    }
    
    func addGesture() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(didTapOnCustomView))
        swipeGesture.direction = .left
        view.addGestureRecognizer(swipeGesture)
    }
    
    func addSwitchController() {
        let switchController = UISwitch(frame: .init(x: 0, y: 100, width: 80, height: 40))
        switchController.isOn = true
        switchController.onTintColor = .brown
        
        view.addSubview(switchController)
    }
    
    func addButton() {
        let button = UIButton(frame: .init(x: 0, y: 300, width: 80, height: 40))
//        button.setTitle("Tap to me", for: .normal)
//        button.setImage(UIImage(named: "vk-icon"), for: .normal)
        button.addTarget(self, action: #selector(didTapOnCustomView), for: .touchUpInside)
        view.addSubview(button)
    }
}
