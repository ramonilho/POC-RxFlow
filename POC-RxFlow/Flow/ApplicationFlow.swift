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
    
    lazy var mainStepper: ApplicationStepper = {
        return ApplicationStepper()
    }()
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? ApplicationStep else { return NextFlowItems.none }
        
        switch step {
        case .dashboard:
            return navigationToDashboard()
        }
    }
    
    private func navigationToDashboard() -> NextFlowItems {
        let dashboardFlow = DashboardFlow()
        
        Flows.whenReady(flow1: dashboardFlow) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }
        
        return .one(flowItem: NextFlowItem(nextPresentable: dashboardFlow,
                                           nextStepper: dashboardFlow.mainStepper))
    }
    
}

class ApplicationStepper: Stepper {
    
    init() {
        goToDashboard()
    }
    
    func goToDashboard() {
        step.accept(ApplicationStep.dashboard)
    }
    
}
