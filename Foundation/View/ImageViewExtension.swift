//
//  ImageViewExtension.swift
//  Demo
//
//  Created by Foryou on 2018/9/18.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView{
    
    func setImageUrl(_ url:String?, placeholder:UIImage? = nil)
    {
        let urlEncode = url?.urlEncode()
        if urlEncode == nil
        {
            self.image = placeholder
            return
        }
        
        let temp = URL(string: urlEncode!)
        self.kf.setImage(with: ImageResource(downloadURL: temp!), placeholder: placeholder, options: nil, progressBlock: nil, completionHandler: nil)
    }
}
