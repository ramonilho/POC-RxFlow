//
//  RedCreateFlow.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class RedCreateFlow {
    
    let rootVC = RedSelectDateVC()
    
    lazy var rootNavigation: UINavigationController = {
        return UINavigationController(rootViewController: rootVC)
    }()
    
}

extension RedCreateFlow: Flow {
    func navigate(to step: Step) -> NextFlowItems {
        
        switch step {
        
        case RedStep.Create.selected(let date):
            return navigationRandomNumbers(with: date)
            
        case RedStep.Create.finished(let model):
            return navigationCreateFinished(with: model)
            
        case RedStep.Create.canceled:
            return navigationCancel()
        
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
    
    func navigationCancel() -> NextFlowItems {
        self.rootNavigation.dismiss(animated: true)
        return .triggerParentFlow(withStep: RedStep.Create.canceled)
    }
    
    func navigationCreateFinished(with model: RedModel) -> NextFlowItems {
        self.rootNavigation.dismiss(animated: true)
        return .triggerParentFlow(withStep: RedStep.Create.finished(model: model))
    }

    func navigationRandomNumbers(with date: Date) -> NextFlowItems {
        let viewModel = RedRandomNumbersViewModel(date: date)
        let randomNumbersVC = RedRandomNumbersVC(viewModel)
        
        self.rootNavigation.pushViewController(randomNumbersVC, animated: true)
        
        return .one(flowItem: NextFlowItem(nextPresentable: randomNumbersVC,
                                           nextStepper: viewModel))
    }
    
}

extension RedStep {
    enum Create: Step {
        case started
        case selected(date: Date)
        case finished(model: RedModel)
        case canceled
    }
}
