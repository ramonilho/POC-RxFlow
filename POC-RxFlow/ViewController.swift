//
//  ViewController.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 03/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit

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
    }

}
