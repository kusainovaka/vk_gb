//
//  FriendHeaderView.swift
//  VKTestApp
//
//  Created by Kamila Kussainova on 27.01.2022.
//

import UIKit

class FriendHeaderView: UIView {
    private let titleLabel = UILabel()
    // UIImageView,
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        titleLabel.textColor = .green
    }
    
    func setText(_ text: String) {
        titleLabel.text = text
    }
}
