//
//  DemoWebViewController.swift
//  Demo
//
//  Created by Foryou on 2018/10/16.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit
import WebKit

class DemoWebViewController: UIViewController , WKScriptMessageHandler {

    var webView : WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UIBarButtonItem(title: "CallJS", style: UIBarButtonItemStyle.done, target: self, action: #selector(clickRightItem));
        self.navigationItem.rightBarButtonItem = item;
        
        let leftItem = UIBarButtonItem(title: "back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(clickLeftItem));
        self.navigationItem.leftBarButtonItem = leftItem;

        // Do any additional setup after loading the view.
        let config = WKWebViewConfiguration()
        config.userContentController.add(self, name: "DemoNativeHandler")
        
        let wv = WKWebView(frame: self.view.bounds, configuration: config)
        self.webView = wv
        self.view.addSubview(wv)
        
        //加载网页
        self.loadWeb()
    }
    
    deinit{
        print("(-) DemoWebViewController")
        
    }
    
    func loadWeb()
    {
        if let url = Bundle.main.url(forResource: "test", withExtension: "html") {
            self.webView?.loadFileURL(url, allowingReadAccessTo: url)

        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage)
    {
        if message.name == "DemoNativeHandler" {
            let alert = UIAlertController(title: "Message from JS received!", message: "Content: \(message.body)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func clickLeftItem()
    {
        self.webView?.configuration.userContentController.removeScriptMessageHandler(forName:"DemoNativeHandler")
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func clickRightItem()
    {
        let jsonText = "onResult(3,7)"
        self.webView?.evaluateJavaScript(jsonText, completionHandler: { (data, error) in
            
            if let sum = data
            {
                print(sum)
            }
            
            if error != nil
            {
                print(error!)
            }
            
        })
    }
}
