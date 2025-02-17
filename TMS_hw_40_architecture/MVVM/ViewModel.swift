//
//  ViewModel.swift
//  TMS_hw_40_architecture
//
//  Created by Alena  on 17.02.25.
//

protocol ViewModelDelegate: AnyObject {
    func counterDidUpdate(counter: Int)
//    func increaseAction(text: String)
//    
//    func decreaseAction(text: String)
}

final class ViewModel {
    private var model: Model
    weak var delegate: ViewModelDelegate?
    
    init(model: Model) {
        self.model = model
    }
    
    func increaseCounter() {
        if model.counter < model.max {
            model.counter = model.counter + 1
            delegate?.counterDidUpdate(counter: model.counter)
        }
    }
       
       func decreaseCounter() {
           if model.counter > model.min {
               model.counter = model.counter - 1
               delegate?.counterDidUpdate(counter: model.counter)
           }
       }
       
       func getCounter() -> Int {
           return model.counter
       }
    
    
//    var text: String = "" {
//        didSet {
//            delegate?.increaseAction(text: text)
//        }
//    }
    
}
