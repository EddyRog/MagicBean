//   Interactor
//  BeanInteractor.swift

import Foundation

protocol BeanInteractorProtocol {
    func fetchBean()
}

class BeanInteractor {
    // VIP
    var presenter: BeanPresenterProtocol?
    
    // data layer
    private let apiWorker: BeanApiWorkerProtocol
    private var beanEntity: BeanEntity?
    
    required init(withApiWorker apiWorker: BeanApiWorkerProtocol) {
        self.apiWorker = apiWorker
    }
}

extension BeanInteractor: BeanInteractorProtocol {
    func fetchBean() {
        // demande a l'api de fetch les data
//
//        apiWorker.fetchCandy { [weak self] (candyEntity) in
//            guard let strongSelf = self else { return }
//            strongSelf.candyEntity = candyEntity
//            strongSelf.presenter?.interactor(strongSelf, didFetch: candyEntity) // self:Interactor, connait Presenter, Presenter recoit un message pour titre interaction disant que interactor a DidFetch the CandyEntity
//        }
        
        apiWorker.fetchBean { [weak self] (beanEntity) in
            guard let strongSelf = self else { return }
            strongSelf.beanEntity = beanEntity
            strongSelf.presenter?.interactor(strongSelf, didFetch : beanEntity)
        }
    }
}
