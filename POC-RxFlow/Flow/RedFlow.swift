//
//  RedFlow.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 03/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class RedFlow: Flow {
    
    var root: Presentable { return self.rootVC }
    
    private let rootVC = UINavigationController()
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? RedStep else { return .none }
        
        switch step {
        case .history:
            return navigationToRed()
        }
    }
    
    func navigationToRed() -> NextFlowItems {
        let vc = ViewController(.red, title: "Red")
        rootVC.pushViewController(vc, animated: true)
        return .none
    }

}

class RedStepper: Stepper {
    init() {
        self.step.accept(RedStep.history)
    }
}

enum RedStep: Step {
    case history
}
