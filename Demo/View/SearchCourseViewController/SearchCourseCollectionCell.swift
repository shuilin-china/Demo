//
//  SearchCourseCollectionCell.swift
//  Demo
//
//  Created by Foryou on 2018/9/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseCollectionCell: UICollectionViewCell {
    
    var item : SearchCourseRectItem?
    {
        didSet{
            
            self.nameLabel?.attributedText = self.item?.title
            self.descLabel?.attributedText = self.item?.desc
            self.titleImageView?.setImageUrl(self.item?.imageUrl, placeholder: UIImage(named: "image_default_holder"))
            
            if self.item != nil
            {
                self.titleHeight?.constant = self.item!.titleHeight
                self.descHeight?.constant = self.item!.descHeight
            }
            
        }
    }
    
    @IBOutlet var titleImageView : UIImageView?
    @IBOutlet var nameLabel : UILabel?
    @IBOutlet var descLabel : UILabel?
    @IBOutlet var titleHeight : NSLayoutConstraint?
    @IBOutlet var descHeight : NSLayoutConstraint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.backgroundColor = UIColor.white
        //self.nameLabel?.backgroundColor = UIColor.orange
    }
    
//    override init(frame:CGRect)
//    {
//        super.init(frame: frame)
//    }
//
//    required init?(coder aDecoder: NSCoder)
//    {
//        super.init(coder: aDecoder)
//    }
}


class SearchCourseSummaryCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.backgroundColor = UIColor.brown
        //self.nameLabel?.backgroundColor = UIColor.orange
    }
    
}


