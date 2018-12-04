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
        
    }

}

class ApplicationStepper: Stepper {
    init() {
        self.step.accept(<#T##event: Step##Step#>)
    }
}
