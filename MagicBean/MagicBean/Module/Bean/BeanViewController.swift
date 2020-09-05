//  View
//  BeanView

import UIKit

protocol BeanViewProtocol: class {
    var interactor: BeanInteractorProtocol? { get set}
    var presenter: BeanPresenterProtocol? {get set}
    var router: BeanRouterProtocol? {get set}
    
    func set(withQuantity quantiy : String)
    func setView(with object: BeanViewModel)
    func setView(with: PriceBeanViewModel)
}

class BeanViewController: UIViewController {
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
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var priceHTLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var gstLabel: UILabel!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var totalNetLabel: UILabel!
    
    // MARK: - MSG
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchBean()
    }
    @IBAction func OrderBean(_ sender: UIStepper) {
        let currentQuantity = Int(sender.value)
        interactor?.update(quantity: currentQuantity)
    }
}

extension BeanViewController: BeanViewProtocol {
    func set(withQuantity quantiy: String) {
        self.quantityLabel.text = quantiy
    }
    func setView(with object: BeanViewModel) {
        self.nameLabel.text = object.name
        self.descriptionTextView.text = object.description
        self.priceHTLabel.text = object.priceHT
        self.gstLabel.text = object.gst
    }
    func setView(with object: PriceBeanViewModel) {
        subTotalLabel.text =  object.subTotal
        totalNetLabel.text = object.totalnet
    }
}
