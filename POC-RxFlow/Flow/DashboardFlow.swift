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
    
    let attendanceFlow = AttendanceHistoryFlow()
    
    let contentFlow = ContentFlow()
    let contentStepper = ContentStepper()
    
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
        Flows.whenReady(flow1: attendanceFlow, flow2: contentFlow) { [unowned self]
            (attendanceRoot: UINavigationController, contentRoot: UINavigationController) in
            
            let attendanceTab = UITabBarItem(title: "Attendance", image: nil, selectedImage: nil)
            attendanceRoot.tabBarItem = attendanceTab
            
            let contentTab = UITabBarItem(title: "Content", image: nil, selectedImage: nil)
            contentRoot.tabBarItem = contentTab
            
            self.rootVC.setViewControllers([attendanceRoot, contentRoot], animated: false)
        }
        
        return .multiple(flowItems: [
            
            NextFlowItem(nextPresentable: attendanceFlow,
                         nextStepper: attendanceFlow.mainStepper),
            
            NextFlowItem(nextPresentable: contentFlow,
                         nextStepper: contentStepper),
            
            ]
        )
    }
}

enum DashboardStep: Step {
    case loadTabs
}
