//
//  StringHelper.swift
//  Demo
//
//  Created by Foryou on 2018/9/7.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

func exString(_ string : String?) -> String!
{
    return (string != nil) ? string! : ""
}

class StringHelper: NSObject {

    
}


extension String {
    
    //将原始的url编码为合法的url
    func urlEncode() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    //将编码后的url转换回原始的url
    func urlDecode() -> String {
        return self.removingPercentEncoding ?? ""
    }
}
