//
//  Example.swift
//  UILifeCycleClosure
//
//  Created by Yuki Takahashi on 2015/10/13.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import Foundation

protocol ExampleProtocol : class {
    
    static var exampleTitle       : String { get }
    static var exampleDescription : String { get }
    static var exampleIdentifier  : String { get }
    
}

extension ExampleProtocol {
    
    static var exampleDescription : String { return "" }
    
}