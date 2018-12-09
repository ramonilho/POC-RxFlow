//
//  AttendanceHistoryVC.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxCocoa
import Toaster

class AttendanceHistoryVC: ViewController {

    let viewModel: AttendanceHistoryViewModel
    
    override init(_ color: UIColor, title: String) {
        viewModel = AttendanceHistoryViewModel()
        super.init(color, title: title)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    convenience init() {
        self.init(.red, title: "Attendance")
        
        self.buttonMain.rx.controlEvent(.touchUpInside)
            .subscribe { [weak self] (tap) in
                self?.viewModel.startAttendanceCreation()
        }.disposed(by: disposeBag)
    }
    
    func presentCancelAttendanceCreationToast() {
        Toast.init(text: "Did cancelled attendance creation").show()
    }
    
}
