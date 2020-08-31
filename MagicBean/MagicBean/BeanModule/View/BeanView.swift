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
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var priceHTLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    // MARK: - MSG
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchBean()
    }
    
    @IBAction func OrderBean(_ sender: UIStepper) {
        print(" ▓ \(#line) ▓   (っ˘▽˘)っ ▓ \(showClass) ▓ ⊂(◕。◕⊂)  ( ˘ ³˘)♥ ▓ \(#function) ▓ ")
    }
}

extension BeanView: BeanViewProtocol {
    func setView(with object: BeanViewModel) {
        self.nameLabel.text = object.name
        self.descriptionTextView.text = object.description
        self.priceHTLabel.text = object.priceHT
        self.quantityLabel.text = object.quantity
        
    }
}
