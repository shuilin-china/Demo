//
//  SearchCourseViewItem.swift
//  Demo
//
//  Created by Foryou on 2018/9/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseViewItem: NSObject {

    var text : String?
    private(set) var tableItem = SearchCourseTableItem()
    private(set) var collectionItem = SearchCourseCollectionItem()
    private(set) var currentListType : Int = 0   // 0 = table, 1 = collection
    private(set) var contentType : Int = 0 // 0 = 无, 1 = empty, 2 = table, 3 = collection
    
    deinit{
        print("(-) SearchCourseViewItem")
    }
    
    func onSearch(callback:@escaping ResultCallback) -> Void
    {
        if self.currentListType == 0
        {
            self.tableItem.text = self.text
            self.tableItem.onSearch { (error) in
                callback(error)
            }
        }
        else if self.currentListType == 1
        {
            self.collectionItem.text = self.text
            self.collectionItem.onSearch { (error) in
                callback(error)
            }
        }
        else
        {
            callback(nil)
        }
    }
    
    func onSwitch()
    {
        
    }
}
