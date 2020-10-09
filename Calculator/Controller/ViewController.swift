//
//  ViewController.swift
//  Calculator
//
//  Created by Justyna Kowalkowska on 17/08/2020.
//  Copyright © 2020 Justyna Kowalkowska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
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
    
    @IBOutlet var functionButtonCollection: [UIButton]!
    
    
    @IBAction func functionButtonPressed(_ sender: UIButton) {
        
        functionButtonCollection.forEach ({ $0.backgroundColor = UIColor.systemOrange
        })
        
        sender.backgroundColor = UIColor.systemYellow
    }
    
    
    
    override func viewDidLoad() {
        
        //Adjusting resize font
        displayLabel.adjustsFontSizeToFitWidth = true
        displayLabel.minimumScaleFactor = 0.7
        
        displayLabel.isUserInteractionEnabled = true
        let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector((longPressFunctin(_:))))
        displayLabel.addGestureRecognizer(longPress)

    }

    @objc func longPressFunctin(_ gestureRecognizer: UILongPressGestureRecognizer) {
        displayLabel.becomeFirstResponder()
        let menu = UIMenuController.shared
        if !menu.isMenuVisible {
            menu.arrowDirection = UIMenuController.ArrowDirection.down
            menu.showMenu(from: view, rect: CGRect(x: self.displayLabel.center.x, y: self.displayLabel.center.y - 8, width: 0.0, height: 0.0))
        }
    }

    override func copy(_ sender: Any?) {
        let board = UIPasteboard.general
        board.string = displayLabel.text
    }
    
    override func paste(_ sender: Any?) {
        if let myString = UIPasteboard.general.string {
            displayLabel.text = myString
        }
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return (action == #selector(copy(_:)) || action == #selector(paste(_:)))
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
                } else if displayLabel.text == "0" && numValue == "0" {
                    return
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
    

