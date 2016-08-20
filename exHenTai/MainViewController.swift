//
//  MainViewController.swift
//  exHenTai
//
//  Created by Yongjia Liu on 16/8/20.
//  Copyright © 2016年 Liebrom. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: innerSpace)
        let data = NSData(contentsOfURL: url!)
        
        let parser = TFHpple(HTMLData: data!)
        let queryString = "//div[@class='ig']/table/tr/td//table[@class='it']/tr/td/a"
        let nodes = parser.searchWithXPathQuery(queryString)
        
        //var newItems = NSMutableArray(capacity: 0);
        
        for node in nodes {
            if let element = node.firstChild as TFHppleElement! {
                print(element.content)
            }
            //print(node)
        }
        
        print(nodes.count)
        //print(nodes)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
