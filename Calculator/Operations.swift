//
//  Operations.swift
//  Calculator
//
//  Created by Stepan Niemykin on 14.09.2020.
//  Copyright © 2020 Stepan Niemykin. All rights reserved.
//

import Foundation

class Operation {
    var operationRun = false
    var operation = ""
    
    enum SingleValueOperation {
        case clear(String)
        case comma(String)
    }
}
