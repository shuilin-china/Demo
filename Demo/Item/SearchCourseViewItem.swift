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
    @objc dynamic private(set) var contentType : Int = 0 // 0 = 无, 1 = empty, 2 = table, 3 = collection
    
    deinit{
        print("(-) SearchCourseViewItem")
    }
    
    func onSearch(callback:@escaping ResultCallback) -> Void
    {
        if self.currentListType == 0
        {
            self.tableItem.text = self.text
            self.tableItem.onSearch { (error) in
                
                self.updateCurrentType()
                
                callback(error)
            }
        }
        else if self.currentListType == 1
        {
            self.collectionItem.text = self.text
            self.collectionItem.onSearch { (error) in
                
                self.updateCurrentType()
                
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
        if self.currentListType == 0
        {
            self.currentListType = 1
            
            self.updateCurrentType()
        }
        else if self.currentListType == 1
        {
            self.currentListType = 0
            
            self.updateCurrentType()
        }
    }
    
    func updateCurrentType()
    {
        if self.currentListType == 0
        {
            if self.tableItem.bEmpty
            {
                self.contentType = 1
            }
            else
            {
                self.contentType = 2
            }
        }
        else if self.currentListType == 1
        {
            if self.collectionItem.bEmpty
            {
                self.contentType = 1
            }
            else
            {
                self.contentType = 3
            }
        }
    }
}
