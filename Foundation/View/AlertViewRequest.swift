//
//  AlertViewRequest.swift
//  Demo
//
//  Created by Foryou on 2018/9/17.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//一般弹框请求
class AlertViewRequest: NSObject {

    var buttonTitles : Array<String?> = ["确定"]
    
    var title : String?
    
    var message : String?
    
    var onController : UIViewController?
    
    //选中那个按钮了
    private(set) var index : Int = 0
    
    func show(callback:@escaping Callback)
    {
        if buttonTitles.count == 0
        {
            self.index = -1
            callback()
            return
        }
        
        let alertController = UIAlertController(title: self.title, message: self.message, preferredStyle: .alert)
        
        //第一个为取消样式
        let action = UIAlertAction(title: buttonTitles[0], style: UIAlertActionStyle.cancel) { (act) in
            
            self.index = 0
            callback()
        }
        alertController.addAction(action)
        
        //其他按钮
        for i in 1..<self.buttonTitles.count
        {
            let action = UIAlertAction(title: buttonTitles[i], style: UIAlertActionStyle.default) { (act) in
                
                self.index = i
                callback()
            }
            
            alertController.addAction(action)
        }
        
        if self.onController != nil
        {
            self.onController!.present(alertController, animated:true, completion:nil)
        }
    }
}
