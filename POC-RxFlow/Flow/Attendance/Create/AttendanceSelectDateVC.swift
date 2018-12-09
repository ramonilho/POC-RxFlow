//
//  AttendanceSelectDateVC.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit

class AttendanceSelectDateVC: ViewController {
    
    let viewModel: AttendanceSelectDateViewModel
    
    override init(_ color: UIColor, title: String) {
        viewModel = AttendanceSelectDateViewModel()
        super.init(color, title: title)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    convenience init() {
        self.init(.orange, title: "Creating attendance")
        
        buttonMain.setTitle("\(viewModel.selectedDate())",
                            for: .normal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: viewModel, action: #selector(viewModel.cancelFlow))
    }
}
