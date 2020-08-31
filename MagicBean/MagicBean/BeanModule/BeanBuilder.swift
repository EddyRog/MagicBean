//  Builder
//  BeanBuilder.swift


import Foundation

class BeanBuilder {
    class func buildModule(arroundView view: BeanView) {
        // MARK: - Initialise compoenent.
        let presenter = BeanPresenter()
        let interactor = BeanInteractor(withApiWorker: BeanApiWorker())
        
        // MARK: - Link VIP Components.
        view.interactor = interactor
        view.presenter = presenter
        view.router = BeanRouter()
        
        presenter.view = view
        interactor.presenter = presenter
        
    }
    
}
