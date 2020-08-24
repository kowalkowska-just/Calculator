
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Justyna Kowalkowska on 19/08/2020.
//  Copyright © 2020 Justyna Kowalkowska. All rights reserved.

import Foundation

struct CalculatorLogic {
    
        private var number: Double?
        private var intermediateCalculation : (n1: Double, calcMethod: String)?
        private var isOperationTapped: Bool = false
    
        mutating func setNumber (_ number: Double) {
            self.number = number
        }
    
        mutating func calculate(symbol: String) -> Double? {
    
            if let n = number {
    
                switch symbol {
                case "+/-":
                    return n * -1
                case "%":
                    return n * 0.01
                case "C":
                    return 0.0
                case "=":
                    return performTwoNumCalculationResult(n2: n)
                default:
                    intermediateCalculation = (n1: n, calcMethod: symbol)
                }
            }
    
            return nil
    
        }
    
        private func performTwoNumCalculationResult(n2: Double) -> Double? {
    
            if let n1 = intermediateCalculation?.n1,
                let operation = intermediateCalculation?.calcMethod {
    
                switch operation {
                case "+":
                    return  n1 + n2
                case "-":
                    return n1 - n2
                case "/":
                    return n1 / n2
                case "x":
                    return n1 * n2
                default:
                    fatalError("The operation passed in doesn't match any of the cases.")
                }
            }
            return nil
        }
    
}
