//
//  HomeFlow.swift
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
        return .none
    }

    private lazy var rootViewController: ViewController = {
        return ViewController()
    }()
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
}
