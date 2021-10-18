//
//  CalculatorManager.swift
//  Calculator
//
//  Created by Kamil Pawlak on 18/10/2021.
//

import Foundation

struct CalculatorManager {
    
    var value: Double?
    
    func calculate(operation: String) -> Double? {
        if let currentValue = value {
            switch operation {
            case "+/-":
                return currentValue * -1
            case "AC":
                return 0
            case "%":
                return currentValue * 0.01
            default:
                return currentValue
            }
        }
        
        return nil
        
    }
    
    
    
    
    
    
    
    
    
}
