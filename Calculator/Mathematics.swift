//
//  Mathematics.swift
//  Calculator
//
//  Created by Stepan Niemykin on 18.09.2020.
//  Copyright © 2020 Stepan Niemykin. All rights reserved.
//

import Foundation

class Mathematics {
    
    static func plus(firstValue: Double, secondValue: Double) -> Double{
        return firstValue + secondValue
    }
    
    func minus(firstValue: Double, secondValue: Double) -> Double {
        return firstValue - secondValue
    }
    
    func divide(firstValue: Double, secondValue: Double) -> Double {
        return firstValue / secondValue
    }
    
    func multiply(firstValue: Double, secondValue: Double) -> Double {
        return firstValue * secondValue
    }
    
    func percentageForOne(value: Double) -> Double {
        return value / 100
    }
    
    func percentageForTwo(firstValue: Double, secondValue: Double) -> Double {
        return firstValue * secondValue / 100
    }
    
    func squareRoot(value: Double) -> Double{
        return sqrt(value)
    }
}
