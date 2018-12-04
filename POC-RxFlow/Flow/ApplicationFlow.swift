//
//  ApplicationFlow.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 03/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class ApplicationFlow: Flow {
    private let rootWindow: UIWindow
    
    init(with window: UIWindow) {
        self.rootWindow = window
    }
    
    var root: Presentable {
        return self.rootWindow
    }
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? StartupStep else { return NextFlowItems.none }
        
        switch step {
        case .home:
            return navigationToDashboard()
        default:
            return NextFlowItems.none
        }
    }
    
    private func navigationToDashboard() -> NextFlowItems {
        let homeFlow = MainFlow()
        
        Flows.whenReady(flow1: homeFlow) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }
        
        return .one(flowItem: NextFlowItem(nextPresentable: homeFlow,
                                           nextStepper: OneStepper(withSingleStep: DashboardStep.initial)))
    }
    
}

class ApplicationStepper: Stepper {
    init() {
        self.step.accept(StartupStep.home)
    }
}
