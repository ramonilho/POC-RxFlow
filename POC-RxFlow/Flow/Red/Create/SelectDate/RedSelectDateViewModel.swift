//
//  RedSelectDateViewModel.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class RedSelectDateViewModel {
    
    var date: Date = Date()
    
    func selectedDate() -> Date {
        return self.date
    }
    
}

extension RedSelectDateViewModel: Stepper {

    @objc func cancelFlow() {
        step.accept(RedStep.Create.canceled)
    }
    
    func nextStep() {
        step.accept(RedStep.Create.selected(date: date))
    }
    
}
