//
//  ImageCell.swift
//  TestExercise
//
//  Created by Nikita Galaganov on 28.09.2020.
//

import Foundation
import Kingfisher
import UIKit
import TinyConstraints

class ImageCell : UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dataLabel)
        contentView.addSubview(logoImageView)
        
        
        logoImageView.edgesToSuperview(insets: .top(0) + .bottom(0) + .right(0))
        dataLabel.right(to: logoImageView)
        dataLabel.edgesToSuperview(insets: .top(10) + .bottom(10) + .left(10))
        dataLabel.centerY(to: contentView)
        
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    let dataLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let logoImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
}
