//
//  AttendanceCreateFlow.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class AttendanceCreateFlow {
    
    let rootVC = AttendanceSelectDateVC()
    
    lazy var rootNavigation: UINavigationController = {
        return UINavigationController(rootViewController: rootVC)
    }()
    
    
}

extension AttendanceCreateFlow: Flow {
    func navigate(to step: Step) -> NextFlowItems {
        
        switch step {
        
        case AttendanceStep.Create.canceled:
            self.rootNavigation.dismiss(animated: true)
            return .triggerParentFlow(withStep: AttendanceStep.cancelCreateAttendance)
        
        case AttendanceStep.Create.selected(_):
            return .none
        
        default:
            return .none
        }
        
    }
    
    var root: Presentable {
        return rootNavigation
    }
    
    var mainStepper: Stepper {
        return rootVC.viewModel
    }

}

extension AttendanceStep {
    enum Create: Step {
        case selected(date: Date)
        
        case canceled
    }
}
