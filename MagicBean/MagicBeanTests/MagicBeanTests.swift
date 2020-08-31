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

    func test_True (){
        XCTAssertTrue(true)
    }
    
    func test_presenter_renderName_fromInteractor() {
        let sut = SpyInteractore(withApiWorker: BeanApiWorker())
        sut.fetchBean()
        XCTAssertEqual(sut.namePresenter, "Bean magical")
    }
    
    
    
    class SpyInteractore: BeanInteractorProtocol {
        var presenter: BeanPresenterProtocol?
        var namePresenter: String?
        
        var apiWorker: BeanApiWorkerProtocol?
        
        func fetchBean() {
            apiWorker?.fetchBean { [weak self] (entityFetched) in
                guard let selfStrong = self else { return }
                
                selfStrong.namePresenter = entityFetched.name
            }
        }
        required init(withApiWorker apiWorker: BeanApiWorkerProtocol) {
            self.apiWorker = apiWorker
        }
    }
    
    //
}
