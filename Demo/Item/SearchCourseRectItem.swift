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

    var title : NSMutableAttributedString = NSMutableAttributedString(string: "")
    var desc : NSMutableAttributedString = NSMutableAttributedString(string: "")
    var imageUrl : String = ""
    var height : CGFloat = 0.0
    var titleHeight : CGFloat = 0.0
    var descHeight : CGFloat = 0.0
    
    var clickCommand : ProtocolCommand?
    
    func onUpdate(info : SearchCourseInfo, width : CGFloat)
    {
        if info.name != nil
        {
            self.title = NSMutableAttributedString(string: info.name!)
            
            //设置样式
            let attributes = [NSAttributedStringKey.foregroundColor: UIColor.darkText,
                               NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)] as [NSAttributedStringKey : Any]
            self.title.addAttributes(attributes, range: NSRange.init(location: 0, length: info.name!.count))
        }
        
        if info.org_name != nil
        {
            self.desc = NSMutableAttributedString(string: info.org_name!)
            
            //设置样式
            let attributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray,
                              NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)] as [NSAttributedStringKey : Any]
            self.desc.addAttributes(attributes, range: NSRange.init(location: 0, length: info.org_name!.count))
        }
        
        self.imageUrl = exString(info.thumbImageUrl)
        
        //计算标题文本高度
        let maxSize = CGSize(width: width, height:CGFloat.greatestFiniteMagnitude)
        
        let titleRect = self.title.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, context: nil)
        let titleHeight = ceil(titleRect.size.height) ;
        self.titleHeight = titleHeight
        
        //计算描述文本高度
        let descRect = self.desc.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, context: nil)
        let descHeight = ceil(descRect.size.height);
        self.descHeight = descHeight
        
        //print("titleHeight : \(titleHeight)")
        
        //计算整个单元格高度
        let height = width * 27.0 / 40.0 + titleHeight + descHeight + 30
        self.height = height
    }
}
