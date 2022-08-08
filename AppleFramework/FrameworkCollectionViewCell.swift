//
//  FrameworkCollectionViewCell.swift
//  AppleFramework
//
//  Created by 윤여진 on 2022/08/08.
//

import UIKit

class FrameworkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.numberOfLines = 1
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ framework: AppleFramework) {
        thumnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
}
