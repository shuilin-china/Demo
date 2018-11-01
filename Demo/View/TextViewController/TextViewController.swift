//
//  TextViewController.swift
//  Demo
//
//  Created by Foryou on 2018/10/31.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class TextViewController: UIViewController, UITextViewDelegate {

    var textView : RichTextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.textView = RichTextView(frame: CGRect(x: 50, y: 100, width: 200, height: 100))
        self.textView?.isEditable = false
        self.textView?.isSelectable = true
        self.textView?.delegate = self
        self.view.addSubview(self.textView!)
        
        self.textView?.attributedText = NSAttributedString(string: "Get the new view controller using segue.destination.Pass the selected object to the new view controller.")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//    func textViewDidChangeSelection(_ textView: UITextView) {
//        
//        textView.selectedRange = NSRange(location: 0, length: 0)
//    }
}
