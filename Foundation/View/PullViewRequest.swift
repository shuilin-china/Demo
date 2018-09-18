//
//  PullViewRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/17.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import ZHRefresh

class PullViewRequest: NSObject {

    var view : UIScrollView
    
    var pullDownCommand : ProtocolCommand?  //下拉刷新命令
    var pullUpCommand : ProtocolCommand?    //上拉加载更多命令
    
    init(view : UIScrollView)
    {
        self.view = view
    }
    
    func prepare()
    {
        //下拉刷新
        let pullDownCommand = self.pullDownCommand
        self.view.header = ZHRefreshNormalHeader.headerWithRefreshing {
            
            if pullDownCommand != nil
            {
                pullDownCommand!.execute([])
            }
            
        }
        
        //上拉加载更多
        let pullUpCommand = self.pullUpCommand
        self.view.footer = ZHRefreshAutoNormalFooter.footerWithRefreshing {
        
            if pullUpCommand != nil
            {
                pullUpCommand!.execute([])
            }
        }
        
    }
    
    func endPullDown()
    {
        self.view.header?.endRefreshing()
    }
    
    func endPullUp()
    {
        self.view.footer?.endRefreshing()
    }
}
