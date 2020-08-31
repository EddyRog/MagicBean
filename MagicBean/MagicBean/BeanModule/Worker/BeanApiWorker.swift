//  API WORKER

import Foundation

protocol BeanApiWorkerProtocol {
    func fetchBean(callBack: (BeanEntity) -> Void)
}

class BeanApiWorker: BeanApiWorkerProtocol {
    func fetchBean(callBack: (BeanEntity) -> Void){
        // simulate get entity
        let description = "When eaten, the consumer's energy and physical health are restored to their fullest; the effects are typically almost instantaneous for the recipient, making these beans a great asset both in and out of battle. "
        let entity = BeanEntity(name: "Bean magical",
                                description: description,
                                priceHT: 100.50,
                                quantity: 0
                                )
        
        // send back data
        callBack(entity)
    }
}
