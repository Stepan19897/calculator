//
//  ViewController.swift
//  Calculator
//
//  Created by Stepan Niemykin on 09.09.2020.
//  Copyright © 2020 Stepan Niemykin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsTyping: Bool = false
    var firstValue: Double = 0
    var secondValue: Double = 0
    var operation = ""
    var result: Double = 0
    var currentlyOnDisplay = ""
    var commaPlaced = false
    
    var currentInput: Double {
        get {
            return Double(displayLabel.text!)!
        } set {
            let value = String(newValue)
            let valueArray = value.components(separatedBy: ".")
            
            if valueArray[1] == "0" {
                displayLabel.text = String(valueArray[0])
            } else {
                displayLabel.text = String(newValue)
            }
            userIsTyping = false
        }
    }

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Actions
    
    
    @IBAction func digitPressed(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping {
            if displayLabel.text!.count < 10   {
                displayLabel.text = displayLabel.text! + digit
            }
        } else {
            displayLabel.text = digit
            userIsTyping = true
        }
        
    }
    
    @IBAction func twoValuesOperation(_ sender: UIButton) {
        operation = sender.currentTitle!
        firstValue = currentInput
        userIsTyping = false
        commaPlaced = false
    }
    
    
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
        if userIsTyping {
            secondValue = currentInput
        }
        commaPlaced = false
        
        switch operation {
        case "+":
            operateWithTwo{$0 + $1}
        case "-":
            operateWithTwo{$0 - $1}
        case "*":
            operateWithTwo{$0 * $1}
        case "/":
            operateWithTwo{$0 / $1}
        default:
            break
        }
    }
    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        currentInput = 0
        displayLabel.text = "0"
        firstValue = 0
        secondValue = 0
        userIsTyping = false
        operation = ""
        commaPlaced = false
    }
    
    
    @IBAction func plusMinusbuttonPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        if firstValue == 0 {
            currentInput = currentInput / 100
        } else {
            secondValue = firstValue * currentInput / 100
        }
        userIsTyping = false
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if userIsTyping && commaPlaced {
            displayLabel.text! += "."
            commaPlaced = true
        } else if !userIsTyping && !commaPlaced {
            displayLabel.text! = "0."
        }
    }
    
    func operateWithTwo(operation: (Double, Double) -> Double) {
        currentInput = operation(firstValue, secondValue)
        userIsTyping = false
    }
    
   //MARK:- enum
    enum TwoValuesOperaion {
        case plus(Double, Double), minus(Double, Double), multiply(Double, Double), divide(Double, Double)
        
        var evaluate: Any {
            switch self {
            case let .plus(firstValue, secondValue):
                return firstValue + secondValue
            case let .minus(firstValue, secondValue):
                return firstValue - secondValue
            case let .multiply(firstValue, secondValue):
                return firstValue * secondValue
            case let .divide(firstValue, secondValue):
                if secondValue == 0 {
                    return "dividing on zero!"
                }
                let result = Double(firstValue) / Double(secondValue)
                return result
            }
        }
    }
}

