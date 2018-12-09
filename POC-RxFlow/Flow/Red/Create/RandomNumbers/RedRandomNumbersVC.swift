//
//  RedRandomNumbersVC.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit

class RedRandomNumbersVC: ViewController {

    var viewModel: RedRandomNumbersViewModel
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    init(_ viewModel: RedRandomNumbersViewModel) {
        self.viewModel = viewModel
        
        super.init(.orange, title: "Random numbers")
        
        buttonMain.setTitle("\(viewModel.generateRandomNumbers())",
            for: .normal)
        
        setupActions()
    }
    
    func setupActions() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: viewModel, action: #selector(viewModel.cancelFlow))
        
        buttonMain.rx.controlEvent(.touchUpInside)
            .subscribe { [weak self] (tap) in
                self?.viewModel.finishFlow()
        }.disposed(by: disposeBag)
    }
    
}

