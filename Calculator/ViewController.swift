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
    let mathematics = Mathematics()
    
    var currentInput: Double {
        get {
//            guard let text = Double(displayLabel.text) else { return }
//            return text
            return Double(displayLabel.text ?? "") ?? 0.0
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
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var displayErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("akjsnfljansmd")
    }
    
    //MARK:- Actions
    
    @IBAction func digitPressed(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        //let digit = sender.currentTitle!
        displayErrorLabel.isHidden = true
        
        if userIsTyping && displayLabel.text != "0" {
            if displayLabel.text!.count < 10   {
                displayLabel.text = displayLabel.text! + digit
            }
        } else {
            displayLabel.text = digit
            userIsTyping = true
        }
        
    }
    
    @IBAction func twoValuesOperation(_ sender: UIButton) {
        //guard let operation = sender.currentTitle else { return }
        operation = sender.currentTitle!
        firstValue = currentInput
        userIsTyping = false
        commaPlaced = false
    }
    
    
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
        secondValue = currentInput
        userIsTyping = false
        commaPlaced = false
        
        switch operation {
        case "+":
            currentInput = Mathematics.plus(firstValue: firstValue, secondValue: secondValue)
        case "-":
            currentInput = mathematics.minus(firstValue: firstValue, secondValue: secondValue)
        case "*":
            currentInput = mathematics.multiply(firstValue: firstValue, secondValue: secondValue)
        case "/":
            if secondValue == 0 {
                displayErrorLabel.text = "Not possible to divide like this😇"
                displayErrorLabel.isHidden = false
            } else {
                currentInput = mathematics.divide(firstValue: firstValue, secondValue: secondValue)
            }
        default:
            break
        }
    }
    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        clear()
    }
    
    
    @IBAction func plusMinusbuttonPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func sqrtButtonPressed(_ sender: UIButton) {
        currentInput = mathematics.squareRoot(value: currentInput)
    }
    
    @IBAction func trigonometricFuncPressed(_ sender: UIButton) {
        let trignometry = sender.currentTitle!
        switch trignometry {
        case "sin":
            currentInput = sin(currentInput)
        case "cos":
            currentInput = cos(currentInput)
        case "tan":
            currentInput = tan(currentInput)
        default:
            break
        }
        
    }
    
    
    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        if firstValue == 0 {
            currentInput = mathematics.percentageForOne(value: currentInput)
        } else {
            secondValue = currentInput
            currentInput = mathematics.percentageForTwo(firstValue: firstValue, secondValue: secondValue)
        }
        userIsTyping = false
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if userIsTyping, !commaPlaced{
            displayLabel.text! += "."
            commaPlaced = true
        } else if !userIsTyping && !commaPlaced {
            displayLabel.text! = "0."
        }
    }
    
    
    @IBAction func piButtonPressed(_ sender: UIButton) {
        currentInput = Double.pi
    }
    
    func clear() {
        currentInput = 0
        displayLabel.text = "0"
        firstValue = 0
        secondValue = 0
        userIsTyping = false
        operation = ""
        commaPlaced = false
        displayErrorLabel.isHidden = true
    }
    
}

