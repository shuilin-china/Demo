//
//  SearchCourseListViewController.swift
//  Demo
//
//  Created by Foryou on 2018/9/10.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class SearchCourseListViewController: UITableViewController {

    var item : SearchCourseTableItem?
    var pullRequest : PullViewRequest?
    var pullingDown : Bool = false
    var pullingUp : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
       
        self.pullRequest = PullViewRequest(view: self.tableView)
        self.pullRequest?.pullDownCommand = ProtocolCommand(target: self, selector: #selector(onPullDown(params:)))
        self.pullRequest?.pullUpCommand = ProtocolCommand(target: self, selector: #selector(onPullUp(params:)))
        self.pullRequest?.prepare()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        let count = self.item?.sectionCount()
        
        return count!
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = self.item?.cellCountAtSection(section: section)
        
        return count!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCourseCell", for: indexPath) as! SearchCourseCell
        
        let item = self.item?.cellItemAt(indexPath: indexPath)
        cell.item = item

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let item = self.item?.cellItemAt(indexPath: indexPath)
        
        if item != nil
        {
            return item!.height
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let item = self.item?.cellItemAt(indexPath: indexPath)
        
        item?.clickCommand?.execute([item])
    }
    
    @objc func onPullDown(params:[Any])
    {
        //print("pull down")
        self.pullingDown = true
        self.item?.onSearch(callback: { (error) in
            
            self.pullRequest?.endPullDown()
            self.pullingDown = false
            
            if error == nil
            {
                self.tableView.reloadData()
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
                self.tableView.reloadData()
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
