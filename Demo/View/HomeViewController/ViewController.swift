//
//  ViewController.swift
//  Demo
//
//  Created by Foryou on 2018/9/3.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//func doWork(block:(String)->(Int),block2:(String)->(Int)) {
//    print("header")
//    let t : Int = block("abc")
//    print(t)
//}

class ViewController: UIViewController {
    
    var button : UIButton = UIButton(type: UIButtonType.system)
    let searchCourseTableItem = SearchCourseTableItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addViews()
        
//        doWork(block: { (text : String) -> (Int) in
//            print("in block")
//
//            return 2
//        }) { (text : String) -> (Int) in
//            print("in block2")
//
//            return 5
//
//        }
//        doWork { (text : String) -> (Int) in
//            print(text)
//            return 3
//        }
        
        //let i = SCREEN_HEIGHT
        
        
//        let command : ProtocolCommand = ProtocolCommand(target: self, selector: #selector(onClickButton4))
//        let result : AnyObject? = command.executeR([1,"hr"])
//        
//        print(result!)
        
//        var items : Array<Any?> = [nil]
//        if items[0] == nil
//        {
//            print("\(items[0])")
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.updateFrame()
    }
    
    func addViews() -> Void
    {
        let button = self.button
        button.setTitle("搜索", for: UIControlState.normal)
        button.addTarget(self, action: #selector(onClickSearchButton), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    func updateFrame() ->Void
    {
        let rect : CGRect = self.view.bounds
        let width : CGFloat = rect.size.width
        let height : CGFloat = rect.size.height
        
        let w : CGFloat = 100.0
        let h : CGFloat = 40.0
        let x : CGFloat = (width - w) / 2
        let y : CGFloat = 200
        self.button.frame = CGRect(x: x, y: y, width: w, height: h)
        
    }
    
    @objc func onClickSearchButton()
    {
        //print("clicked search button")
        
        let item : SearchCourseTableItem = self.searchCourseTableItem
        item.text = "english"
        
        //搜索课程
        item.onSearch { (error) in
            
            if error == nil
            {
                //print("infos : \(request.courseInfos)")
                let vc = SearchCourseViewController()
                vc.item = item
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else
            {
                print(error!)
            }
        }
    }
    
    @objc func onClickButton1() -> Void
    {
        print("onClickButton1")
    }
    
    @objc func onClickButton2(params:Array<Any>) -> Void
    {
        print(params[0])
    }
    
    @objc func onClickButton3() -> AnyObject?
    {
        print("onClickButton3")
        return NSNumber(value: 90)
    }

    @objc func onClickButton4(params:Array<Any>) -> AnyObject?
    {
        print(params[0])
        print(params[1])
        
        return NSNumber(value: 3.67)
    }

}

