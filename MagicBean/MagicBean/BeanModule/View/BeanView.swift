//  View
//  BeanView

import UIKit

protocol BeanViewProtocol: class {
    var interactor: BeanInteractorProtocol? { get set}
    var presenter: BeanPresenterProtocol? {get set}
    var router: BeanRouterProtocol? {get set}
    
    func setView(with object: BeanViewModel)
}

class BeanView: UIViewController {
    // MARK: - MM
    // LOG
    private var showClass: String {
        return String(describing: type(of: self))
    }
    
    // VIP
    var interactor: BeanInteractorProtocol?
    var presenter: BeanPresenterProtocol?
    var router: BeanRouterProtocol?
    
    // UI
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - MSG
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchBean()
    }
}

extension BeanView: BeanViewProtocol {
    func setView(with object: BeanViewModel) {
        self.nameLabel.text = object.name
    }
}
