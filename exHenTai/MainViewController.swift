//
//  MainViewController.swift
//  exHenTai
//
//  Created by Yongjia Liu on 16/8/20.
//  Copyright © 2016年 Liebrom. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var tableView: UITableView!
    var nodes = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
        let tableView = UITableView(frame: self.view.frame)
        self.view.addSubview(tableView);
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "HTCell")
        
        self.tableView = tableView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        
        let url = NSURL(string: innerSpace)
        let data = NSData(contentsOfURL: url!)
        
        let parser = TFHpple(HTMLData: data!)
        let queryString = "//div[@class='ig']/table/tr/td//table[@class='it']/tr/td/a"
        nodes = parser.searchWithXPathQuery(queryString)
        
        for node in nodes {
            if let element = node.firstChild as TFHppleElement! {
                print(element.content)
            }
        }
    }
    

}


extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nodes.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HTCell")
        let node = nodes[indexPath.row]
        if let element = node.firstChild as TFHppleElement! {
            if element.content != "Go To First Page" {
                cell?.textLabel?.text = element.content
            }
            
        }
        return cell!
    }
}
