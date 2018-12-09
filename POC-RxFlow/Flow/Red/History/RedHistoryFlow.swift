//
//  RedFlow.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 03/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow


class RedHistoryFlow {
    
    let rootNavigation = UINavigationController()
    let rootVC = RedHistoryVC()
    
}

extension RedHistoryFlow: Flow {
    
    var root: Presentable {
        return self.rootNavigation
    }
    
    var mainStepper: Stepper {
        return rootVC.viewModel
    }
    
    func navigate(to step: Step) -> NextFlowItems {
        switch step {
        case RedStep.history:
            return navigationHistory()
            
        case RedStep.Create.started:
            return navigationCreateRed()
            
        case RedStep.Create.finished(let model):
            return navigationFinishedCreateRed(model: model)
            
        case RedStep.Create.canceled:
            return navigationCancelCreateRed()
            
        default:
            return .none
        }
    }
    
    func navigationHistory() -> NextFlowItems {
        rootNavigation.pushViewController(rootVC, animated: true)
        return .none
    }
    
    func navigationCreateRed() -> NextFlowItems {
        let createFlow = RedCreateFlow()
        
        rootNavigation.present(createFlow.rootNavigation, animated: true)
        
        return .one(flowItem: NextFlowItem(nextPresentable: createFlow,
                                           nextStepper: createFlow.mainStepper))
    }
    
    func navigationCancelCreateRed() -> NextFlowItems {
        rootVC.presentCancelRedCreationToast()
        return .none
    }
    
    func navigationFinishedCreateRed(model: RedModel) -> NextFlowItems {
        rootVC.presentCreateRedToast(model: model)
        return .none
    }
    
    func navigationToDashboard() -> NextFlowItems {
        return .none
    }

}

enum RedStep: Step {
    case history
}
