//
//  RedHistoryViewModel.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class RedHistoryViewModel: Stepper {
    
    init() {
        step.accept(RedStep.history)
    }
    
    func startRedCreation() {
        step.accept(RedStep.Create.started)
    }

}
