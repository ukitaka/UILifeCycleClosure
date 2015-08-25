//
//  UnitTests.swift
//  UnitTests
//
//  Created by Yuki Takahashi on 2015/10/13.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import XCTest
import UILifeCycleClosure

class UnitTests: XCTestCase {
    
    func testLCCFlgs() {
        let obj = NSObject()
        var key = Selector("test")
        
        // default value is false
        XCTAssert( obj.lcc_flgForKey(&key) == false )
        
        // set & get value
        obj.lcc_setFlg(true, forKey: &key)
        XCTAssert( obj.lcc_flgForKey(&key) == true )
    }
    
}
