//
//  ExampleTableViewController.swift
//  UILifeCycleClosure
//
//  Created by yuki.takahashi on 08/25/2015.
//  Copyright (c) 2015 yuki.takahashi. All rights reserved.
//

import UIKit
import UILifeCycleClosure

class ExampleTableViewController : UITableViewController {
    
    private let examples : [ExampleProtocol.Type] = [
        Example1ViewController.self,
        Example2ViewController.self
    ]
    
    // MARK: - tableView
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("ExampleCell") else {
            preconditionFailure()
        }
        let example = examples[indexPath.row]
        cell.textLabel?.text = example.exampleTitle
        cell.detailTextLabel?.text = example.exampleDescription
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let example = examples[indexPath.row]
        performSegueWithIdentifier(example.exampleIdentifier, sender: nil)
    }
    
}

