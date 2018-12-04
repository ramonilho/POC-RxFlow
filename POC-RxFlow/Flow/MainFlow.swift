//
//  MainFlow.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 03/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class MainFlow: Flow {
    
    var root: Presentable {
        return self.rootViewController
    }
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? DashboardStep else { return NextFlowItems.none }
        switch step {
        case .initial:
            return navigationToDashboard()
        default:
            return .none
        }
    }
    
    let rootViewController = UITabBarController()

    private func navigationToDashboard() -> NextFlowItems {
        let redFlow = RedFlow()
        let greenFlow = GreenFlow()
        
        Flows.whenReady(flow1: redFlow, flow2: greenFlow) { [unowned self] (rootRed: UINavigationController, rootGreen: UINavigationController) in
            
            let redTabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
            rootRed.tabBarItem = redTabBarItem
            
            let greenTabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
            rootGreen.tabBarItem = greenTabBarItem
            
            self.rootViewController.setViewControllers([rootRed, rootGreen], animated: false)
        }
        
        return .multiple(flowItems: [
            NextFlowItem(nextPresentable: redFlow, nextStepper: RedStepper()),
            NextFlowItem(nextPresentable: greenFlow, nextStepper: GreenStepper()),
            ]
        )
    }
    
}
