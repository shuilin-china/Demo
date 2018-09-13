//
//  CourseKeyListViewController.swift
//  Demo
//
//  Created by Foryou on 2018/9/12.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class CourseKeyListViewController: UITableViewController {

    var item : CourseKeyTableItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //self.tableView.register(UINib(nibName: "CourseKeyCell", bundle: nil), forCellReuseIdentifier: "CourseKeyCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateUI()
    {
        self.tableView.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseKeyCell", for: indexPath) as! CourseKeyCell
        
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

}
