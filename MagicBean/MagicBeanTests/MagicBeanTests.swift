//
//  MagicBeanTests.swift
//  MagicBeanTests
//
//  Created by Eddy R on 31/08/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import XCTest
@testable import MagicBean

class MagicBeanTests: XCTestCase {

    let sut = SpyInteractore(withApiWorker: BeanApiWorker())
    
    func test_True (){
        XCTAssertTrue(true)
    }
    
    func test_presenter_renderName_fromInteractor() {
        sut.fetchBean()
        XCTAssertEqual(sut.namePresenter, "Bean magical")
    }
    
    func test_calculatePricehtWithQuantity0 (){
        sut.fetchBean()
        let beanHtBase = sut.beanHtbase
        sut.calculFinalPriceHtWith(quantity:0, beanHt: beanHtBase)
        XCTAssertEqual(sut.finalPriceHT, 0)
    }
    
    func test_calculatePricehtWithQuantity2 (){
        sut.fetchBean()
//        let beanHtBase = sut.beanHtbase
        _ = sut.calculFinalPriceHtWith(quantity:2, beanHt: 100)
        XCTAssertEqual(sut.finalPriceHT, 200)
    }

    func test_calculPriceTTCwithQuantity1() {
        sut.calculFinalPriceTTCWith(GST: 50, finalPrice:100)
        XCTAssertEqual(sut.finalPriceTTC, 150)
    }
    
    func test_calculFinalPrice_and_GetRightTTCWithZeroQuantity() {
        // STOP HERE 🚦🌁🏝☀️🏖🐬🏝🏞🏜🚦
        sut.calculPriceWithGST(withBasePrice: 100, quantity: 0, gst: 50)
        XCTAssertEqual(sut.priceTTWith2product, 0)
    }
    func test_calculFinalPrice_and_GetRightTTC() {
        // STOP HERE 🚦🌁🏝☀️🏖🐬🏝🏞🏜🚦
        sut.calculPriceWithGST(withBasePrice: 100, quantity: 2, gst: 50)
        XCTAssertEqual(sut.priceTTWith2product, 300)
    }
    
    
    
    class SpyInteractore: BeanInteractorProtocol {
        var presenter: BeanPresenterProtocol?
        var namePresenter: String?
        var apiWorker: BeanApiWorkerProtocol?
        
        var finalPriceHT:Float = 0
        var beanHtbase: Float = 0
        var finalPriceTTC: Float = 0
        var gst: Float = 50 // %
        var priceTTWith2product:Float = 0
        
        required init(withApiWorker apiWorker: BeanApiWorkerProtocol) {
            self.apiWorker = apiWorker
        }
        func fetchBean() {
            apiWorker?.fetchBean { [weak self] (entityFetched) in
                guard let selfStrong = self else { return }
                selfStrong.namePresenter = entityFetched.name
                selfStrong.beanHtbase = entityFetched.priceHT
            }
        }
        
        func calculFinalPriceHtWith(quantity:Int, beanHt: Float) ->Float {
            self.finalPriceHT = Float(quantity) * beanHt
            return Float(quantity) * beanHt
        }
        func calculFinalPriceTTCWith(GST: Float, finalPrice:Float) -> Float {
            let resultGst = finalPrice * (GST/100)
            let resultTTC = finalPrice + resultGst
            self.finalPriceTTC = resultTTC
            return resultTTC
        }
        
        
        /// <#Description#>
        /// - Parameters:
        ///   - beanHt: <#beanHt description#>
        ///   - quantity: <#quantity description#>
        ///   - gst: <#gst description#>
        func calculPriceWithGST(withBasePrice beanHt: Float, quantity: Int, gst: Float) {
            let sumBaseHT = calculFinalPriceHtWith(quantity: quantity, beanHt: beanHt)
            let sumTTC = calculFinalPriceTTCWith(GST: gst, finalPrice: sumBaseHT)
            self.priceTTWith2product = sumTTC
        }
                
        func update(quantity: Int) {
            apiWorker?.fetchBean { [weak self] (entityFetched) in
                guard self != nil else { return }
                
                
                // logic
                
                
            }
        }
    }
    
    //
}
