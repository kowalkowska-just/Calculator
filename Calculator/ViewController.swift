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
    
    @IBOutlet weak var displayLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display text label to a Double.")
        }
        
        if let calcMethod = sender.currentTitle {
            
            if calcMethod == "+/-" {
                displayLabel.text = String(-1 * number)
            } else if calcMethod == "%" {
                displayLabel.text = String(number/100)
            } else if calcMethod == "C" {
                displayLabel.text = "0.0"
            }
        }
        
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert display text label to a Double. ")
                    }
                
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
            
        }
    }
}

