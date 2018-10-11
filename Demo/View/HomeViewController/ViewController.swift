//
//  ViewController.swift
//  Demo
//
//  Created by Foryou on 2018/9/3.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var clearButton : UIButton = UIButton(type: UIButtonType.system)
    weak var searchCourseViewItem : SearchCourseViewItem?
    weak var courseKeyTableItem : CourseKeyTableItem?

    var keyListViewController : CourseKeyListViewController?
    @IBOutlet var keyTextField : UITextField?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.doInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.doInit()
    }
    
    func doInit()
    {
        self.addNotifications()
        
        let storyboard = UIStoryboard(name: "SearchCourse", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "CourseKeyListViewController") as? CourseKeyListViewController
        {
            self.keyListViewController = vc
            let item = CourseKeyTableItem()
            item.clickKeyCellCommand = ProtocolCommand(target: self, selector: #selector(onClickKeyItem(params:)))
            vc.item = item
            
            self.courseKeyTableItem = item
        }
    }
    
    deinit {
        self.removeNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //加载子视图
        self.addViews()
        
        //加载
        self.reloadKeyListViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.updateFrame()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    func addViews() -> Void
    {
        //"清空"按钮
        let button = self.clearButton
        button.setTitle("清空", for: UIControlState.normal)
        button.addTarget(self, action: #selector(onClearButton), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.isHidden = true
        
        //搜索记录
        if self.keyListViewController != nil
        {
            self.addChildViewController(self.keyListViewController!)
            self.view.addSubview(self.keyListViewController!.view)
        }
        
    }
    
    func updateFrame() ->Void
    {
        let rect : CGRect = self.view.bounds
        let width : CGFloat = rect.size.width
        let height : CGFloat = rect.size.height
        
        let w : CGFloat = 60.0
        let h : CGFloat = 30.0
        let x : CGFloat = width - w - 6
        let y : CGFloat = 270
        self.clearButton.frame = CGRect(x: x, y: y, width: w, height: h)
        
        self.keyListViewController!.view.frame = CGRect(x: 0, y: 300, width: width, height: height - 300)
    }
    
    func addNotifications()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(onNotifyAddCourseKey), name: NSNotification.Name(kCourseKeyAddNotification), object: nil)
    }
    
    func removeNotifications()
    {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(kCourseKeyAddNotification), object: nil)
    }
    
    @IBAction func onClickSearchButton(sender:AnyObject)
    {
        self.keyTextField?.resignFirstResponder()
        
        let key = self.keyTextField?.text
        
        //记录
        self.courseKeyTableItem?.onAddKey(key) { (error) in
            
        }
        
        //搜索
        self.searchKey(key: self.keyTextField?.text)
    }
    
    @objc func onClearButton()
    {
        //print("clicked search button")
        
        let request = AlertViewRequest()
        request.message = "确定删除所有记录？"
        request.buttonTitles = ["取消","确定"]
        request.onController = self
        request.show {
            
            if request.index == 1
            {
                self.courseKeyTableItem?.onClear { (error) in
                    
                    if error == nil
                    {
                        self.reloadKeyListViewController()
                    }
                }
            }
        }
    }
    
    @objc func onClickKeyItem(params:Array<Any>)
    {
        let item = params[0] as? CourseKeyCellItem
        if item != nil
        {
            self.searchKey(key: item?.title)
        }
    }
    
    func reloadKeyListViewController()
    {
        self.courseKeyTableItem?.onLoad { (error) in
            
            if error == nil
            {
                self.keyListViewController!.updateUI()
            }
            
            self.clearButton.isHidden = self.courseKeyTableItem == nil || self.courseKeyTableItem!.isEmpty()
        }
    }
    
    func searchKey(key:String?)
    {
        let item : SearchCourseViewItem = SearchCourseViewItem()
        item.text = key
        item.collectionItem.rectList.width = self.view.bounds.size.width
        self.searchCourseViewItem = item
        
        //搜索课程
        HudRequest.showLoading(true)
        
        item.onSearch { (error) in
            
            if item != self.searchCourseViewItem
            {
                return
            }
            
            HudRequest.showLoading(false)
            
            if error == nil
            {
                //print("infos : \(request.courseInfos)")
                let vc = SearchCourseViewController()
                vc.item = item
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else
            {
                //print(error!)
                HudRequest.show(text: error?.msg)
            }
        }
    }
    
    
    @objc func onNotifyAddCourseKey(note:Notification)
    {
        self.reloadKeyListViewController()
    }
    
}

