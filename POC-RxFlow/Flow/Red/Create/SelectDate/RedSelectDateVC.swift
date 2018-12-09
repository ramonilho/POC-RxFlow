//
//  RedSelectDateVC.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit

class RedSelectDateVC: ViewController {
    
    let viewModel: RedSelectDateViewModel
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(_ color: UIColor, title: String) {
        viewModel = RedSelectDateViewModel()
        super.init(color, title: title)
    }
    
    convenience init() {
        self.init(.orange, title: "Creating red")
        
        buttonMain.setTitle("\(viewModel.selectedDate())",
                            for: .normal)
        
        setupActions()
    }
    
    func setupActions() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: viewModel, action: #selector(viewModel.cancelFlow))
        
        buttonMain.rx.controlEvent(.touchUpInside)
            .subscribe { [weak self] tap in
                self?.viewModel.nextStep()
        }.disposed(by: disposeBag)
    }
}
