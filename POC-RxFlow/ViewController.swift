//
//  ViewController.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 03/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit
import SnapKit

// Simple VC with a unique button
class ViewController: UIViewController {

    private let color: UIColor
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")}
    
    init(_ color: UIColor, title: String) {
        self.color = color
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = title
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = self.color
        view.addSubview(buttonMain)
        
        buttonMain.snp.makeConstraints { (make) in
            make.center.width.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    lazy var buttonMain: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("tap here to start flow", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .black
        return view
    }()

}
