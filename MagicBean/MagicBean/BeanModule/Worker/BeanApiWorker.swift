//  API WORKER

import Foundation

protocol BeanApiWorkerProtocol {
    func fetchBean(callBack: (BeanEntity) -> Void)
}

class BeanApiWorker: BeanApiWorkerProtocol {
    func fetchBean(callBack: (BeanEntity) -> Void){
        // simulate get entity
        let entity = BeanEntity(name: "Bean magical")
        
        // send back data
        callBack(entity)
    }
}
