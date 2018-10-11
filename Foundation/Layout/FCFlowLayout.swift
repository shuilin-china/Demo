//
//  FCFlowLayout.swift
//  Demo
//
//  Created by Foryou on 2018/10/10.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//自定义的流式布局

protocol FCRectList {
    var fc_size : CGSize {get}
    func fc_rectAt(indexPath : IndexPath) -> CGRect?
}


class FCFlowLayout: UICollectionViewFlowLayout {

    var rectList : FCRectList?
    
    override func prepare() {
    
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = super.layoutAttributesForItem(at: indexPath)
        
        if attributes != nil
        {
            self.modifyLayoutAttributes(attributes: attributes!)
        }
        
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributesInRect = super.layoutAttributesForElements(in: rect)
        
        if attributesInRect != nil
        {
            for cellAttributes : UICollectionViewLayoutAttributes in attributesInRect!
            {
                self.modifyLayoutAttributes(attributes: cellAttributes)
            }
        }
        

        return attributesInRect
    }
    
    //    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    //
    //    }
    
    override var collectionViewContentSize: CGSize {
        
        if self.rectList != nil
        {
            return self.rectList!.fc_size
        }
        
        return CGSize(width: 0.0, height: 0.0)
    }
    
//    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        
//        return true
//    }
    
    func modifyLayoutAttributes(attributes : UICollectionViewLayoutAttributes)
    {
        if self.rectList != nil
        {
            let indexPath = attributes.indexPath
            if let rect = self.rectList!.fc_rectAt(indexPath: indexPath) //获取相应序号的rect
            {
                //修改frame，达到新布局的效果
                attributes.frame = rect
            }
        }
    }
    
}
