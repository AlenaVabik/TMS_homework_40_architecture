//
//  Model.swift
//  TMS_hw_40_architecture
//
//  Created by Alena  on 17.02.25.
//

struct Model {
    var counter: Int
    let min: Int
    let max: Int
    
    init(counter: Int = 0, min: Int = 0, max: Int = 50) {
        self.counter = counter
        self.min = min
        self.max = max
    }
}
