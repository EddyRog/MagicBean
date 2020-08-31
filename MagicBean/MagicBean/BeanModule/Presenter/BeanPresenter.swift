//  Presenter
//  BeanPresenter


import Foundation
// MARK: - ViewModel Layer / Presenter
struct BeanViewModel {
    let name: String
}


protocol BeanPresenterProtocol: class {
    // delegate
    func interactor(_ interactor: BeanInteractorProtocol, didFetch object: BeanEntity )
}

class BeanPresenter {
    // MARK: - MM
    weak var view: BeanViewProtocol?
}

extension BeanPresenter: BeanPresenterProtocol {
    
    // MARK: - MSG
    func interactor(_ interactor: BeanInteractorProtocol, didFetch object: BeanEntity) {
        // pre present data before go on the scene
        let nameVM = "** \(object.name) **"
        
        let beanViewModel = BeanViewModel(name: nameVM)
        view?.setView(with: beanViewModel)
        
    }
}
