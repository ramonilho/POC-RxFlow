//
//  GreenFlow.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 03/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class GreenFlow: Flow {
    
    var root: Presentable { return self.rootVC }
    
    private let rootVC = UINavigationController()
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? GreenStep else { return .none }
        
        switch step {
        case .history:
            return navigationToGreen()
        }
    }
    
    func navigationToGreen() -> NextFlowItems {
        let vc = ViewController(.green, title: "Green")
        rootVC.pushViewController(vc, animated: true)
        return .none
    }
    
}

class GreenStepper: Stepper {
    init() {
        self.step.accept(GreenStep.history)
    }
}

enum GreenStep: Step {
    case history
}
