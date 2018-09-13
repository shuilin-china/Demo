//
//  SearchCourseCellItem.swift
//  Demo
//
//  Created by Foryou on 2018/9/10.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseCellItem: NSObject {

    var title : String = ""
    var desc : String = ""
    var imageUrl : String = ""
    var height : CGFloat = 0.0
    
    var clickCommand : ProtocolCommand?
    
    func onUpdate(info : SearchCourseInfo)
    {
        self.title = info.name
        self.desc = info.org_name
        self.imageUrl = info.thumbImageUrl
        self.height = 70
    }
}
