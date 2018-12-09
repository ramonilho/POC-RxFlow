//
//  RedHistoryVC.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import RxCocoa
import Toaster

class RedHistoryVC: ViewController {

    let viewModel: RedHistoryViewModel
    
    override init(_ color: UIColor, title: String) {
        viewModel = RedHistoryViewModel()
        super.init(color, title: title)
    }
    
    convenience init() {
        self.init(.red, title: "Red")
        
        self.buttonMain.rx.controlEvent(.touchUpInside)
            .subscribe { [weak self] (tap) in
                self?.viewModel.startRedCreation()
        }.disposed(by: disposeBag)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func presentCancelRedCreationToast() {
        Toast.init(text: "Did cancelled red creation").show()
    }
    
    func presentCreateRedToast(model: RedModel) {
        Toast.init(text: "Red created on \(model.date)\nwith numbers: \(model.randomNumbers)").show()
    }
    
}
