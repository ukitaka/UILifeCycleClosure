//
//  Example2ViewController.swift
//  UILifeCycleClosure
//
//  Created by Yuki Takahashi on 2015/10/13.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import UIKit

class Example2ViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dummyExpensiveComputation {
            self.afterViewDidAppear { [unowned self] in
                let vc = Example2DetailViewController.instantiate()
                self.showViewController(vc, sender: nil)
            }
        }
    }
    
    // Some expensive computation.
    // It may or may not complete before 'viewDidAppear:'.
    func dummyExpensiveComputation(completion: () -> ()) {
        //dummy
        completion()
    }
    
}

class Example2DetailViewController : UIViewController {
    
    @IBOutlet private weak var label : UILabel!
    
    class func instantiate() -> Example2DetailViewController {
        return UIStoryboard(name: "Example2", bundle: nil)
            .instantiateViewControllerWithIdentifier("Detail") as! Example2DetailViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        afterViewDidAppear { [unowned self] in
            self.label.text = "afterViewDidAppear1"
        }
        
        afterViewDidAppear { [unowned self] in
            self.label.text = "afterViewDidAppear2"
        }
        
    }
    
}


// MARK: -

extension Example2ViewController : ExampleProtocol {
    
    static var exampleTitle       : String { return "Example2" }
    static var exampleDescription : String { return "afterViewDidAppear" }
    static var exampleIdentifier  : String { return "Example2" }
    
}