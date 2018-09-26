//
//  SearchCourseRectItem.swift
//  Demo
//
//  Created by Foryou on 2018/9/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//SearchCourseCollectionItem的单元格模型

class SearchCourseRectItem: NSObject {

    var title : String = ""
    var desc : String = ""
    var imageUrl : String = ""
    var size : CGSize = CGSize(width: 0, height: 0)
    
    var clickCommand : ProtocolCommand?
    
    func onUpdate(info : SearchCourseInfo)
    {
        self.title = exString(info.name)
        self.desc = exString(info.org_name)
        self.imageUrl = exString(info.thumbImageUrl)
        self.size = CGSize(width: 100, height: 120)
    }
}
