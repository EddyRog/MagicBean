//  Presenter
//  BeanPresenter


import Foundation
// MARK: - ViewModel Layer / Presenter
struct BeanViewModel {
    let name: String
    let description: String
    let priceHT: String
    let gst: String
}

protocol BeanPresenterProtocol: class {
    // delegate
    func interactor(_ interactor: BeanInteractorProtocol, didUpdate quantity: Int)
    func interactor(_ interactor: BeanInteractorProtocol, didFetch object: BeanEntity )
}

class BeanPresenter {
    // MARK: - MM
    weak var view: BeanViewProtocol?
}

// MARK: - MSG
extension BeanPresenter: BeanPresenterProtocol {
    func interactor(_ interactor: BeanInteractorProtocol, didUpdate quantity: Int) {
        let quantity = "quantity : \(quantity)"
        self.view?.set(withQuantity: quantity)
    }
    
    func interactor(_ interactor: BeanInteractorProtocol, didFetch object: BeanEntity) {
        // pre present data before go on the [scene/ View]
        let nameVM = "** \(object.name) **"
        let beanViewModel = BeanViewModel(
                name: nameVM,
                description: object.description,
                priceHT: "\(object.priceHT) € per unit",
                gst: "GST \(object.tax) %"
        )
        view?.setView(with: beanViewModel)
    }
}
