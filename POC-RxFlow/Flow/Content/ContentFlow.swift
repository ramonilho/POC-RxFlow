//
//  ContentFlow.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 03/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class ContentFlow: Flow {
    
    var root: Presentable { return self.rootVC }
    
    private let rootVC = UINavigationController()
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? ContentStep else { return .none }
        
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

class ContentStepper: Stepper {
    init() {
        self.step.accept(ContentStep.history)
    }
}

enum ContentStep: Step {
    case history
}
