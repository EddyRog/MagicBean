//  Presenter
//  BeanPresenter


import Foundation
// MARK: - ViewModel Layer / Presenter
struct BeanViewModel {
    let name: String
    let description: String
    let priceHT: String
    let quantity: String
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
        let beanViewModel = BeanViewModel(
            name: nameVM,
            description: object.description,
            priceHT: "\(object.priceHT) € per unit",
            quantity: "quantity : \(object.quantity)"                              
        )
        view?.setView(with: beanViewModel)
    }
}
