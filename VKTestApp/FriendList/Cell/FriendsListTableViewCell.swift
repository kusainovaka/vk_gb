//
//  FriendsListTableViewCell.swift
//  VKTestApp
//
//  Created by Kamila on 17.01.2022.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: "FriendsListTableViewCell", bundle: nil)
    }
    
    @IBOutlet private var titleLabel: UILabel?
    @IBOutlet private var contactImageView: UIImageView?
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel?.text = nil
        contactImageView?.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    func setData(with data: FirendsListCellModel) {
        titleLabel?.text = data.name
        contactImageView?.image = UIImage(named: data.imageName)
    }
}
