//
//  UIView+LCC.swift
//  Pods
//
//  Created by Yuki Takahashi on 2015/10/13.
//
//

import Foundation

public extension UIView {
    
    public func afterAwakeFromNib(block: () -> ()) {
        try! afterAwakeFromNibSafety(block)
    }
    
    public func afterAwakeFromNibSafety(block: () -> ()) throws {
        if self.lcc_isAwakedFromNib {
            block()
            return
        }
        try self.dynamicType
            .aspect_hookSelector(Selector("awakeFromNib"),
                withOptions: AspectOptions.PositionAfter.union(.OptionAutomaticRemoval),
                usingVoidBlock: { (_) in
                    var key = Selector("lcc_isAwakedFromNib")
                    self.lcc_setFlg(true, forKey: &key)
                    block()
            })
    }
    
}