//
//  UIViewController+LCC.swift
//  Pods
//
//  Created by Yuki Takahashi on 2015/10/9.
//
//

import UIKit
import Aspects

// MARK: - viewDidLoad

public extension UIViewController {
    
    public func afterViewDidLoad(block: () -> ()) {
        try! afterViewDidLoadSafety(block)
    }
    
    public func afterViewDidLoadSafety(block: () -> ()) throws {
        if self.isViewLoaded() {
            block()
            return
        }
        try self.dynamicType.aspect_hookSelector(
            Selector("viewDidLoad"),
            withOptions: AspectOptions.PositionAfter.union(.OptionAutomaticRemoval),
            usingVoidBlock: { (_) in block() }
        )
    }
    
}

// MARK: - viewDidAppear

public extension UIViewController {
    
    public func afterViewDidAppear(block: () -> ()) {
        try! afterViewDidAppearSafety(block)
    }
    
    public func afterViewDidAppearSafety(block: () -> ()) throws {
        if self.lcc_isViewAppeared {
            block()
            return
        }
        try self.dynamicType.aspect_hookSelector(
            Selector("viewDidAppear:"),
            withOptions: AspectOptions.PositionAfter.union(.OptionAutomaticRemoval),
            usingVoidBlock: { (_) in
                var key = Selector("lcc_isViewAppeared")
                self.lcc_setFlg(true, forKey: &key)
                block()
            }
        )
    }
    
}