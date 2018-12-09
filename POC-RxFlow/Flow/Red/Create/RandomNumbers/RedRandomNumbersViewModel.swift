//
//  RedRandomNumbersViewModel.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class RedRandomNumbersViewModel {
    
    var model: RedModel
    
    init(date: Date) {
        self.model = RedModel(with: date)
    }
    
    func generateRandomNumbers() -> [Int] {
        var list: [Int] = []
        
        (1...3).forEach { _ in
            list.append(Int(arc4random_uniform(10)))
        }
        
        self.model.randomNumbers = list
        
        return list
    }

}

extension RedRandomNumbersViewModel: Stepper {
    
    @objc func cancelFlow() {
        step.accept(RedStep.Create.canceled)
    }
    
    func finishFlow() {
        step.accept(RedStep.Create.finished(model: model))
    }
    
}

