//
//  SearchCourseCell.swift
//  Demo
//
//  Created by Foryou on 2018/9/10.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseCell: UITableViewCell {

    var item : SearchCourseCellItem?
    {
        didSet{
            
            self.titleLabel?.text = self.item?.title
            self.descLabel?.text = self.item?.desc
            self.titleImageView?.setImageUrl(self.item?.imageUrl, placeholder: UIImage(named: "image_default_holder"))
        }
    }
    
    @IBOutlet var titleImageView : UIImageView?
    @IBOutlet var titleLabel : UILabel?
    @IBOutlet var descLabel : UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
