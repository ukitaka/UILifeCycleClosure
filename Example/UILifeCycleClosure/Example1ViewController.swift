//
//  Example1ViewController.swift
//  UILifeCycleClosure
//
//  Created by Yuki Takahashi on 2015/10/13.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import UIKit

class Example1ViewController : UIViewController {
    
    @IBOutlet weak var textField : UITextField!
    
    @IBAction func buttonDidTouchUpInside(_: UIButton) {
        performSegueWithIdentifier("Detail", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailVC = segue.destinationViewController as? Example1DetailViewController {
            // IBOutlet is not loaded yet.
            // detailVC.label.text = textField.text
            
            // Use 'afterViewDidLoad'
            detailVC.afterViewDidLoad { [unowned self] in
                detailVC.label.text = self.textField.text
            }
        }
    }
    
}

class Example1DetailViewController : UIViewController {
    
    @IBOutlet weak var label : UILabel!
    
    @IBAction func buttonDidTouchUpInside(_: UIButton) {
        // if isViewLoaded is true, invoke a block immediately.
        afterViewDidLoad { [unowned self]  in
            if let text = self.label.text?.lowercaseString {
                self.label.text = text
            }
        }
    }
    
    @IBAction func nextButtonDidTouchUpInside(_: UIButton) {
        if let text = self.label.text {
            let vc = Example1Detail2ViewController.instantiate()
            vc.configLabel(text)
            self.showViewController(vc, sender: nil)
        }
    }
    
}

class Example1Detail2ViewController: UIViewController {
    
    @IBOutlet weak var label : UILabel!
    
    class func instantiate() -> Example1Detail2ViewController {
        return UIStoryboard(name: "Example1", bundle: nil)
            .instantiateViewControllerWithIdentifier("Detail2") as! Example1Detail2ViewController
    }
    
    func configLabel(text: String) {
        afterViewDidLoad { [unowned self] in
            self.label.text = text
        }
    }
    
}


// MARK: -

extension Example1ViewController : ExampleProtocol {
    
    static var exampleTitle       : String { return "Example1" }
    static var exampleDescription : String { return "afterViewDidLoad" }
    static var exampleIdentifier  : String { return "Example1" }
    
}