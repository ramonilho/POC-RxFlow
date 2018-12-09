//
//  RedFlow.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 03/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow


class AttendanceHistoryFlow {
    
    let rootNavigation = UINavigationController()
    let rootVC = AttendanceHistoryVC()
    
}

extension AttendanceHistoryFlow: Flow {
    
    var root: Presentable {
        return self.rootNavigation
    }
    
    var mainStepper: Stepper {
        return rootVC.viewModel
    }
    
    func navigate(to step: Step) -> NextFlowItems {
        switch step {
        case AttendanceStep.history:
            return navigationToRed()
        case AttendanceStep.startCreateAttendance:
            return navigationToPurple()
        case AttendanceStep.cancelCreateAttendance:
            return navigationToCancelToast()
        default:
            return .none
        }
    }
    
    func navigationToRed() -> NextFlowItems {
        rootNavigation.pushViewController(rootVC, animated: true)
        return .none
    }
    
    func navigationToPurple() -> NextFlowItems {
        let createFlow = AttendanceCreateFlow()
        
        rootNavigation.present(createFlow.rootNavigation, animated: true)
        
        return .one(flowItem: NextFlowItem(nextPresentable: createFlow,
                                           nextStepper: createFlow.mainStepper))
    }
    
    func navigationToCancelToast() -> NextFlowItems {
        rootVC.presentCancelAttendanceCreationToast()
        return .none
    }
    
    func navigationToDashboard() -> NextFlowItems {
        return .none
    }

}

enum AttendanceStep: Step {
    case history
    case startCreateAttendance
    case cancelCreateAttendance
}
