//
//  RootViewController.swift
//  Demo
//
//  Created by Foryou on 2018/9/17.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UINavigationControllerDelegate {
    
    var currentRoot : DemoNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.currentRoot = DemoNavigationController(rootViewController: vc)
        self.currentRoot!.delegate = self;
        
        self .addChildViewController(self.currentRoot!)
        self.view.addSubview(self.currentRoot!.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.currentRoot?.view.frame = self.view.bounds
    }
    

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if let vc = viewController as? ViewController
        {
            self.currentRoot?.setNavigationBarHidden(true, animated: true)
        }
        else
        {
            self.currentRoot?.setNavigationBarHidden(false, animated: true)
        }
    }

}
