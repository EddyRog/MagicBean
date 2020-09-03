//  Builder
//  BeanBuilder.swift


import Foundation

class BeanBuilder {
    class func buildModule(arroundView view: BeanViewController) {
        // MARK: - Initialise compoenent.
        let interactor = BeanInteractor(withApiWorker: BeanApiWorker())
        let presenter = BeanPresenter()
        
        // MARK: - Link V-I-P Components.
        view.interactor = interactor // view knows interactor
        view.router = BeanRouter()   // view knows router
        
        interactor.presenter = presenter // interactor knows presenter
        
        presenter.view = view // interactor knows view ( weak ref to avoid strong recycle)
    }   
}
