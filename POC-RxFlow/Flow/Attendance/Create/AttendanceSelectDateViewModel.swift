//
//  AttendanceSelectDateViewModel.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class AttendanceSelectDateViewModel {
    
    func selectedDate() -> Date {
        return Date()
    }

}

extension AttendanceSelectDateViewModel: Stepper {

    @objc func cancelFlow() {
        step.accept(AttendanceStep.Create.canceled)
    }
    
}
