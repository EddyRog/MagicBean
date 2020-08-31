//  View
//  BeanView

import UIKit

protocol BeanViewProtocol: class {
    var interactor: BeanInteractorProtocol? { get set}
    var presenter: BeanPresenterProtocol? {get set}
    var router: BeanRouterProtocol? {get set}
}

class BeanView: UIViewController {
    // VIP
    var interactor: BeanInteractorProtocol?
    var presenter: BeanPresenterProtocol?
    var router: BeanRouterProtocol?
    
    
    private var showClass: String {
        return String(describing: type(of: self))
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" ▓ \(#line) ▓   (っ˘▽˘)っ ▓ \(showClass) ▓ ⊂(◕。◕⊂)  ( ˘ ³˘)♥ ▓ \(#function) ▓ ")    
    }
}

extension BeanView: BeanViewProtocol {
    
}
