//
//  AppDelegate.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 03/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let disposeBag = DisposeBag()
    var window: UIWindow?
    var coordinator = Coordinator()
    lazy var applicationFlow: ApplicationFlow = {
        return ApplicationFlow(with: window!)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        logFlowNavigation()
        
        coordinator.coordinate(flow: applicationFlow,
                               withStepper: applicationFlow.mainStepper)
        
        return true
    }
    
    private func logFlowNavigation() {
        coordinator.rx.didNavigate.subscribe { (event) in
            let flow: String = "\(String(describing: event.element?.0))"
            let step: String = "\(String(describing: event.element?.1))"
            
            print("did navigate to flow=\(flow) and step=\(step)")
        }.disposed(by: disposeBag)
    }

}

