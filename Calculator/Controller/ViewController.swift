//
//  ViewController.swift
//  Calculator
//
//  Created by Justyna Kowalkowska on 17/08/2020.
//  Copyright © 2020 Justyna Kowalkowska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    
    @IBAction func deleteSwipe(_ sender: Any) {
        
        displayLabel.text?.removeLast()
        
        if let display = displayLabel.text?.count {
            if display == 0 {
                displayLabel.text = "0"
                isFinishedTypingNumber = true
            }
        }
    }

    @IBAction func copyTap(_ sender: Any) {
        
        print("I tapped")
        UIPasteboard.general.string = displayLabel.text
    }
    
    private var displayValue: Double {
        get {
                guard let number = Double(displayLabel.text!) else {
                    fatalError("Cannot convert display text label to a Double.")
                }
            return number
        }
        set {
            displayLabel.text! = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        
        //Adjusting resize font
        displayLabel.adjustsFontSizeToFitWidth = true
        displayLabel.minimumScaleFactor = 0.2
    }


    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {

            if let result = calculator.calculate(symbol: calcMethod) {

            displayValue = result
            }
        }
    }

    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                
                if numValue == "." {
                    displayLabel.text = "0."
                } else {
                displayLabel.text = numValue
                }
                
                isFinishedTypingNumber = false
                
            } else {
                
                if numValue == "." {
                    if displayLabel.text?.contains(".") == true {
                        return
                    }
                } else if displayValue == 0.0 && numValue == "0" {
                    return
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
    

