//
//  AttendanceHistoryViewModel.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxFlow

class AttendanceHistoryViewModel: Stepper {
    
    init() {
        step.accept(AttendanceStep.history)
    }
    
    func startAttendanceCreation() {
        step.accept(AttendanceStep.startCreateAttendance)
    }

}
