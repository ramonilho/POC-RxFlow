//
//  DashboardFlow.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 03/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class DashboardFlow {
    
    // MARK: - Root
    
    let rootVC = UITabBarController()
    
    // MARK: - Main Flows
    
    let redFlow = RedHistoryFlow()
    
    let greenFlow = GreenFlow()
    let greenStepper = GreenStepper()
    
}

// MARK: - Flow Navigation
extension DashboardFlow: Flow {
    
    var root: Presentable {
        return self.rootVC
    }
    
    var mainStepper: Stepper {
        return OneStepper(withSingleStep: DashboardStep.loadTabs)
    }
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? DashboardStep else { return NextFlowItems.none }
        switch step {
        case .loadTabs:
            return navigationToDashboard()
        default:
            return .none
        }
    }
    
    private func navigationToDashboard() -> NextFlowItems {
        Flows.whenReady(flow1: redFlow, flow2: greenFlow) { [unowned self]
            (redRoot: UINavigationController, greenRoot: UINavigationController) in
            
            let redTab = UITabBarItem(title: "Red", image: nil, selectedImage: nil)
            redRoot.tabBarItem = redTab
            
            let greenTab = UITabBarItem(title: "Green", image: nil, selectedImage: nil)
            greenRoot.tabBarItem = greenTab
            
            self.rootVC.setViewControllers([redRoot, greenRoot], animated: false)
        }
        
        return .multiple(flowItems: [
            
            NextFlowItem(nextPresentable: redFlow,
                         nextStepper: redFlow.mainStepper),
            
            NextFlowItem(nextPresentable: greenFlow,
                         nextStepper: greenStepper),
            
            ]
        )
    }
}

enum DashboardStep: Step {
    case loadTabs
}
