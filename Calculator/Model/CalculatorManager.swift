//
//  CalculatorManager.swift
//  Calculator
//
//  Created by Kamil Pawlak on 18/10/2021.
//

import Foundation

struct CalculatorManager {
    
    private var value: Double?
    
    private var plusMinusDivisionMultiplyCalculation: (firstValue: Double, operaton: String)?
    
    mutating func setValue(_ value: Double) {
        self.value = value
    }
    
    mutating func calculate(operation: String) -> Double? {
        if let currentValue = value {
            switch operation {
            case K.Operation.plusMinus:
                return currentValue * -1
            case K.Operation.AC:
                return 0
            case K.Operation.percentage:
                return currentValue * 0.01
            case K.Operation.equal:
                return performCalculationWithTwoNumbers(secondValue: currentValue)
            default:
                plusMinusDivisionMultiplyCalculation = (firstValue: currentValue, operaton: operation)
            }
        }
        return nil
        
    }
    
    private func performCalculationWithTwoNumbers(secondValue: Double) -> Double? {
        
        if let firstValue = plusMinusDivisionMultiplyCalculation?.firstValue, let operation = plusMinusDivisionMultiplyCalculation?.operaton {
            
            switch operation {
            case K.Operation.plus: return firstValue + secondValue
            case K.Operation.minus: return firstValue - secondValue
            case K.Operation.multiply: return firstValue * secondValue
            case K.Operation.division: return firstValue / secondValue
            default:
                fatalError("error with operation: plus, minus, division, multiply")
            }
        }
        return nil
    }
    


    
    
}
