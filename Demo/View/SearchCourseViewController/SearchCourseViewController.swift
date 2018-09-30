//
//  SearchCourseViewController.swift
//  Demo
//
//  Created by Foryou on 2018/9/7.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseViewController: UIViewController {

    var _item : SearchCourseViewItem?
    var item : SearchCourseViewItem?
    {
        get{
            return _item
        }
        
        set{
            
            self.removeItemKVO()
            
            _item = newValue
            
            self.addItemKVO()
        
            _item?.tableItem.clickCourseCellCommand = ProtocolCommand(target: self, selector: #selector(onClickCourseItem(params:)))
            self.listViewController?.item = _item?.tableItem
            self.collectionViewController?.item = _item?.collectionItem
        }

    }
    
    var listViewController : SearchCourseListViewController?
    var emptyViewController : SearchCourseEmptyViewController?
    var collectionViewController : SearchCourseCollectionViewController?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let storyboard = UIStoryboard(name: "SearchCourse", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "SearchCourseListViewController") as? SearchCourseListViewController
        {
            self.listViewController = vc
        }
        if let vc = storyboard.instantiateViewController(withIdentifier: "SearchCourseEmptyViewController") as? SearchCourseEmptyViewController
        {
            self.emptyViewController = vc
        }
        if let vc = storyboard.instantiateViewController(withIdentifier: "SearchCourseCollectionViewController") as? SearchCourseCollectionViewController
        {
            self.collectionViewController = vc
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit{
        print("(-) SearchCourseViewController")
        self.item = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.addViews()
    
        self.updateUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.updateFrame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func addViews()
    {
        let item = UIBarButtonItem(title: "change", style: UIBarButtonItemStyle.done, target: self, action: #selector(clickRightItem));
        self.navigationItem.rightBarButtonItem = item;
        
        
        if self.listViewController != nil
        {
            self.addChildViewController(self.listViewController!)
            self.view.addSubview(self.listViewController!.view)
            self.listViewController!.view.isHidden = true
        }
        
        if self.emptyViewController != nil
        {
            self.addChildViewController(self.emptyViewController!)
            self.view.addSubview(self.emptyViewController!.view)
            self.emptyViewController!.view.isHidden = true
        }
        
        if self.collectionViewController != nil
        {
            self.addChildViewController(self.collectionViewController!)
            self.view.addSubview(self.collectionViewController!.view)
            self.collectionViewController!.view.isHidden = true
        }
        
    }
    
    func updateFrame()
    {
        let rect : CGRect = self.view.bounds
        let width : CGFloat = rect.size.width
        let height : CGFloat = rect.size.height
        
        self.listViewController?.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.collectionViewController?.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    func updateUI()
    {
        if self.emptyViewController != nil  && self.item != nil
        {
            self.emptyViewController!.view.isHidden = (self.item!.contentType != 1)
        }
        
        if self.listViewController != nil && self.item != nil
        {
            self.listViewController!.view.isHidden = (self.item!.contentType != 2)
        }
        
        if self.collectionViewController != nil  && self.item != nil
        {
            self.collectionViewController!.view.isHidden = (self.item!.contentType != 3)
        }
        
    }
    
    
    @objc func onClickCourseItem(params:Array<Any>)
    {
        if let item = params[0] as? SearchCourseCellItem
        {
            //print("onClickCourseItem : \(item!.title)")
            let request = AlertViewRequest()
            request.title = "课程"
            request.message = item.title
            request.onController = self
            request.show {
                
            }
        }
        else
        {
            print("param 0 为空")
        }
        
    }
    
    func addItemKVO()
    {
        self.item?.addObserver(self, forKeyPath: "contentType", options: [.new, .old], context: nil)
    }
    
    func removeItemKVO()
    {
        self.item?.removeObserver(self, forKeyPath: "contentType", context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let item = object as? SearchCourseViewItem
        {
            if item == self.item
            {
                if keyPath == "contentType"
                {
                    self.updateUI()
                }
            }
        }
    }
    
    @objc func clickRightItem()
    {
        self.item?.onSwitch()
    }
}
