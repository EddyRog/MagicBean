//
//  BeanCalculationNetWorkerTest.swift
//  MagicBeanTests
//
//  Created by Eddy R on 05/09/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import Foundation
import XCTest
@testable import MagicBean

class BeanCalculationNetWorkerTest: XCTestCase {
    
    func test_True(){
        XCTAssertTrue(true)
    }
    
    func test_baseWith_0quantity(){
        let sut = BeanCalculWorker()
        let subtotal = sut.calculSubTotal(base: 100, quantity: 0)
        XCTAssertEqual(subtotal, 0)
    }
    func test_baseWith_1quantity(){
        let sut = BeanCalculWorker()
        let subtotal = sut.calculSubTotal(base: 100, quantity: 1)
        XCTAssertEqual(subtotal, 100)
    }
    func test_baseWith_2quantity(){
        let sut = BeanCalculWorker()
        let subtotal = sut.calculSubTotal(base: 100, quantity: 2)
        XCTAssertEqual(subtotal, 200)
    }
    func test_baseWith_negative1quantity(){
        let sut = BeanCalculWorker()
        let subtotal = sut.calculSubTotal(base: 100, quantity: -1)
        XCTAssertEqual(subtotal, 0)
    }
    func test_baseWith_1quantity_taxe50Percent(){
        let sut = BeanCalculWorker()
        let net = sut.calculTotalNet(base: 100, quantity: 3, tax: 19.6)
        
        XCTAssertEqual(net, 358.8)
    }
    

}
