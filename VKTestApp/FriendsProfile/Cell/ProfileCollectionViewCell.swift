//
//  ProfilwCollectionViewCell.swift
//  VKTestApp
//
//  Created by Kamila Kussainova on 27.01.2022.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
    }
    static var cellId = "ProfileCollectionViewCellId"
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLayers()
    }
    
    func config(data: String) {
        
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        setupLayers()
    }
    
    func setupLayers() {
        profileImageView.layer.cornerRadius = 10
    }
}
