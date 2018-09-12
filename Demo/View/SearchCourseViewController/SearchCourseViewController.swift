//
//  SearchCourseViewController.swift
//  Demo
//
//  Created by Foryou on 2018/9/7.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseViewController: UIViewController {

    var item : SearchCourseTableItem?
    {
        didSet{
            self.item?.clickCourseCellCommand = ProtocolCommand(target: self, selector: #selector(onClickCourseItem))
            self.listViewController?.item = self.item
        }
    }
    
    var listViewController : SearchCourseListViewController?
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let storyboard = UIStoryboard(name: "SearchCourse", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "SearchCourseListViewController") as? SearchCourseListViewController
        {
            self.listViewController = vc
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit{
        print("(-) SearchCourseViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.addViews()
    
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
        if self.listViewController != nil
        {
            self.addChildViewController(self.listViewController!)
            self.view.addSubview(self.listViewController!.view)
        }
    }
    
    func updateFrame()
    {
        let rect : CGRect = self.view.bounds
        let width : CGFloat = rect.size.width
        let height : CGFloat = rect.size.height
        
        self.listViewController?.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    
    @objc func onClickCourseItem(params:Array<Any>)
    {
        let item = params[0] as? SearchCourseCellItem

        if item != nil
        {
            print("onClickCourseItem : \(item!.title)")
        }
        else
        {
            print("param 0 为空")
        }
        
    }
}
