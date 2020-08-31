//
//  BeanPresenter.swift
//  MagicBean
//
//  Created by Eddy R on 31/08/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import Foundation

protocol BeanPresenterProtocol: class {
    
}

class BeanPresenter {
    weak var view: BeanViewProtocol?
}

extension BeanPresenter: BeanPresenterProtocol {
    
}
