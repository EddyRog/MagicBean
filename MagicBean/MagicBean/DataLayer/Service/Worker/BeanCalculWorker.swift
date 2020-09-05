//
//  BeanCalculWorker.swift
//  MagicBean
//
//  Created by Eddy R on 05/09/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import Foundation

class BeanCalculWorker {
    
    class func calculSubTotal(base: Float, quantity: Int) -> Float {
        if quantity < 0 {
            return 0 * base
        }
        return base * Float(quantity)
    }
   
    class func calculTotalNet(base: Float, quantity: Int, tax:Float) -> Float {
        let baseNet = calculSubTotal(base: base, quantity: quantity)
        let taxNet =  baseNet * (tax / 100)
        return taxNet + baseNet
    }
    
}
