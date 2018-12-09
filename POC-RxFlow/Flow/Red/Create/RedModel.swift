//
//  RedModel.swift
//  POC-RxFlow
//
//  Created by Ramon Honorio on 09/12/18.
//  Copyright © 2018 Ramon Honorio. All rights reserved.
//

import UIKit

struct RedModel {

    var date: Date
    
    var randomNumbers: [Int]
    
    init(with date: Date) {
        self.date = date
        self.randomNumbers = []
    }
    
}
