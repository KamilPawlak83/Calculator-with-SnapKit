//
//  CalculatorManager.swift
//  Calculator
//
//  Created by Kamil Pawlak on 18/10/2021.
//

import Foundation

struct CalculatorManager {
    
    private var value: Double?
    
    private var plusMinusSubstrMultiplyCalculation: (firstValue: Double, operaton: String)?
    
    mutating func setValue(_ value: Double) {
        self.value = value
    }
    
    mutating func calculate(operation: String) -> Double? {
        if let currentValue = value {
            switch operation {
            case "+/-":
                return currentValue * -1
            case "AC":
                return 0
            case "%":
                return currentValue * 0.01
            case "=":
                return performCalculationWithTwoNumbers(secondValue: currentValue)
            default:
                plusMinusSubstrMultiplyCalculation = (firstValue: currentValue, operaton: operation)
               
            }
        }
        
        return nil
        
    }
    
    private func performCalculationWithTwoNumbers(secondValue: Double) -> Double? {
        
        if let firstValue = plusMinusSubstrMultiplyCalculation?.firstValue, let operation = plusMinusSubstrMultiplyCalculation?.operaton {
            
            switch operation {
            case "+": return firstValue + secondValue
            case "-": return firstValue - secondValue
            case "×": return firstValue * secondValue
            case "÷": return firstValue / secondValue
            default:
                fatalError("error with operation: plus, minus, substract, multiply")
            }
        }
        return nil
    }
    


    
    
}
