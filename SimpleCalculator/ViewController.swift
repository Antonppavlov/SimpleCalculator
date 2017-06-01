//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Anton Pavlov on 31.05.17.
//  Copyright © 2017 Anton Pavlov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayResultLabel: UILabel!
    
    var stillTyping = false
    var doIsPlayced = false
    var firstOperation:Double = 0.0
    var secondOperation:Double = 0.0
    var operation = ""
    
    var currentInpur:Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set{
            let valueArr = String(newValue).components(separatedBy: ".")
            if valueArr[1] == "0"{
                 displayResultLabel.text! = valueArr[0]
            }else{
                displayResultLabel.text! = "\(newValue)"
            }
            stillTyping=false
        }
    }
    

    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        if(!stillTyping){
            displayResultLabel.text = ""
            stillTyping = true
        }
        
        if (displayResultLabel.text?.characters.count)! < 20 {
            displayResultLabel.text = displayResultLabel.text! + number
        }
    }
    
    
    @IBAction func twoOperantSignPressed(_ sender: UIButton) {
        operation = sender.currentTitle!
        firstOperation = currentInpur
        stillTyping = false
        doIsPlayced = false

    }
    
    @IBAction func qualitySignPress(_ sender: UIButton) {
        if stillTyping {
            secondOperation = currentInpur
        }
        
        doIsPlayced = false
        
        switch operation {
        case "+":
            currentInpur = firstOperation + secondOperation
        case "-":
            currentInpur = firstOperation - secondOperation
        case "×":
            currentInpur = firstOperation * secondOperation
        case "÷":
            currentInpur = firstOperation / secondOperation

        default:
           break
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        stillTyping = false
        doIsPlayced = false
        firstOperation = 0.0
        secondOperation = 0.0
        operation = ""
        currentInpur = 0
    }
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        currentInpur = -currentInpur
    }
    
    @IBAction func persestangeButtonPressed(_ sender: UIButton) {
        if firstOperation == 0 {
            currentInpur  = currentInpur / 100
        }
        else{
            currentInpur = firstOperation * currentInpur / 100
        }
    }
    @IBAction func squareRootButtonPressed(_ sender: UIButton) {
         currentInpur = sqrt(currentInpur)
    }
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stillTyping && !doIsPlayced{
            displayResultLabel.text = displayResultLabel.text! + "."
            doIsPlayced = true
        }
        
    }
}

