//
//  SearchCourseCollectionViewController.swift
//  Demo
//
//  Created by Foryou on 2018/9/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SearchCourseCollectionCell"

class SearchCourseCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var item : SearchCourseCollectionItem?
    var pullRequest : PullViewRequest?
    var pullingDown : Bool = false
    var pullingUp : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.collectionView?.backgroundColor = UIColor.lightGray
        
        //设置瀑布流布局
        let layout = FCFlowLayout()
        layout.rectList = self.item?.rectList
        self.collectionView?.collectionViewLayout = layout
        
        // Register cell classes
        //self.collectionView!.register(SearchCourseCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        //self.collectionView?.register(UINib(nibName: "SearchCourseCollectionCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
        
        self.pullRequest = PullViewRequest(view: self.collectionView!)
        self.pullRequest?.pullDownCommand = ProtocolCommand(target: self, selector: #selector(onPullDown(params:)))
        self.pullRequest?.pullUpCommand = ProtocolCommand(target: self, selector: #selector(onPullUp(params:)))
        self.pullRequest?.prepare()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if self.item != nil
        {
            return self.item!.sectionCount()
        }
        
        return 0;
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.item != nil
        {
            return self.item!.cellCountAtSection(section: section)
        }
        
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = self.item?.cellItemAt(indexPath: indexPath)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchCourseCollectionCell
        cell.item = item
        
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = self.item?.cellItemAt(indexPath: indexPath)
        
        item?.clickCommand?.execute([item])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let item = self.item?.rectList.fc_rectAt(indexPath: indexPath)
        
        if item != nil
        {
            return item!.size
        }
        
        return CGSize(width: 0, height: 0)
    }
    
    /*自定义布局，不能实现以下方法，否则会出现个别cell刷不出来
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        if self.item != nil
        {
            return self.item!.rectList.insets
        }
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    */
    
    /*自定义布局，下面方法也没用
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        if self.item != nil
        {
            return self.item!.rectList.inter
        }
        
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        if self.item != nil
        {
            return self.item!.rectList.lineSpace
        }
        
        return 0.0
    }
    */
    
    //
    
    @objc func onPullDown(params:[Any])
    {
        //print("pull down")
        self.pullingDown = true
        self.item?.onSearch(callback: { (error) in
            
            self.pullRequest?.endPullDown()
            self.pullingDown = false
            
            if error == nil
            {
                self.collectionView?.reloadData()
            }
            else
            {
                HudRequest.show(text: error?.msg)
            }
        })
    }
    
    @objc func onPullUp(params:[Any])
    {
        //print("pull up")
        self.pullingUp = true
        self.item?.onSearchMore(callback: { (error) in
            
            self.pullRequest?.endPullUp()
            self.pullingUp = false
            
            if error == nil
            {
                self.collectionView?.reloadData()
                
            }
            else
            {
                HudRequest.show(text: error?.msg)
            }
        })
    }
    
    func beginPullDown()
    {
        self.pullRequest?.beginPullDown()
    }
    
    func beginPullup()
    {
        self.pullRequest?.beginPullUp()
    }
    
}
