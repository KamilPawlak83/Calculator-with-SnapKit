//
//  Constants.swift
//  Calculator
//
//  Created by Kamil Pawlak on 15/10/2021.
//
import UIKit

struct K {
    
    struct ButtonColour {
        static let numbers = UIColor.init(named: K.Colour.lightGreen)
        static let topRowOperations = UIColor.init(named: K.Colour.darkGreen)
        static let rightColumnOperations = UIColor.init(named: K.Colour.lime)
        static let background = UIColor.init(named: K.Colour.black)
    }
    
    struct Colour {
        static let lightGreen = "Light Green"
        static let darkGreen = "Dark Green"
        static let lime = "Lime"
        static let black = "Black"
    }
    
    struct Operation {
        static let plus = "+"
        static let minus = "-"
        static let multiply = "×"
        static let division = "÷"
        static let equal = "="
        static let plusMinus = "+/-"
        static let AC = "AC"
        static let percentage = "%"
    }
    
    struct Number {
        static let one = "1"
        static let two = "2"
        static let three = "3"
        static let four = "4"
        static let five = "5"
        static let six = "6"
        static let seven = "7"
        static let eight = "8"
        static let nine = "9"
        static let zero = "0"
    }
    
}


