//
//  ViewController.swift
//  ParseSetup
//
//  Created by Monte's Pro 13" on 3/12/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var streams: [Stream]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return streams?.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        
        if (streams != nil) {
            cell.stream = streams![indexPath.row]
        }
       
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    @IBAction func addNewStream(sender: AnyObject) {
        print("Add button clicked")
        let newStream = Stream(name: "New Stream! Yay!")
        print("The new stream created is (name): \(newStream.name)")
        streams?.append(newStream)
        print(streams?.count)
        print("New stream created and appened to the streams array")
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

