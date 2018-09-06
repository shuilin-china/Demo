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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        
        let request : SearchCourseRequest = SearchCourseRequest()
        
        request.send { (error) in
            if error == nil
            {
                if request.courseInfos != nil
                {
                    print("infos : \(request.courseInfos!)")
                }
                else
                {
                    print("no course")
                }
            }
            else
            {
                print(error!)
            }
        }
        
        
        let command : ProtocolCommand = ProtocolCommand(target: self, selector: #selector(onClickButton4))
        let result : AnyObject? = command.executeR([1,"hr"])
        
        print(result!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

