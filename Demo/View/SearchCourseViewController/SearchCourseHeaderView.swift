//
//  SearchCourseHeaderView.swift
//  Demo
//
//  Created by Foryou on 2018/10/11.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseHeaderView: UICollectionReusableView {
    
    var label:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        
        self.label = UILabel(frame: CGRect(x: 10.0, y: 0.0, width: self.bounds.size.width - 10.0 * 2, height: 30))
        self.label.text = "这是一个头部区域"
        self.addSubview(self.label)
        
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
