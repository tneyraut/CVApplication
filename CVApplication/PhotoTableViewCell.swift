//
//  PhotoTableViewCell.swift
//  CVApplication
//
//  Created by Thomas Mac on 07/07/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let decalage = CGFloat(10.0)
        
        self.textLabel?.frame = CGRectMake(decalage, 5.0, self.frame.size.width - 2 * decalage, 30.0 - decalage)
        
        self.imageView?.frame = CGRectMake(decalage, (self.textLabel?.frame.size.height)! + decalage, self.frame.size.width - 2 * decalage, self.frame.size.height - (self.textLabel?.frame.size.height)! - 2 * decalage)
        
        self.layer.borderColor = UIColor(red:213.0/255.0, green:210.0/255.0, blue:199.0/255.0, alpha:1.0).CGColor
        
        self.layer.borderWidth = 2.5
        self.layer.cornerRadius = 7.5
        self.layer.shadowOffset = CGSizeMake(0, 1)
        self.layer.shadowColor = UIColor.lightGrayColor().CGColor
        self.layer.shadowRadius = 8.0
        self.layer.shadowOpacity = 0.8
        self.layer.masksToBounds = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
