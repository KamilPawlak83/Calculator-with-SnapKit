//
//  ViewController.swift
//  Calculator
//
//  Created by Kamil Pawlak on 15/10/2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var isFinishedTyping = true
    
    private var isDotUsed = false
    
    private var valueOnTextLabel: Double {
            get {
                guard let currentValue = Double(textLabel.text!) else {
                    fatalError("Double(textLabel.text! error")
                }
                return currentValue
            }
            set {
                textLabel.text = String(newValue)
            }
    }
    
    private var calculatorManager = CalculatorManager()
    
    //MARK: - Text Label Section
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = K.ButtonColour.background
        return view
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = K.Number.zero
        label.font = .systemFont(ofSize: K.FontSize.textLabel)
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - First Row
    
    private let firstRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let ACButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Operation.AC, for: .normal)
        button.backgroundColor = K.ButtonColour.topRowOperations
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.addTarget(self, action: #selector(nonNumberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let plusMinusButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Operation.plusMinus, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.backgroundColor = K.ButtonColour.topRowOperations
        button.addTarget(self, action: #selector(nonNumberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let percentageButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Operation.percentage, for: .normal)
        button.backgroundColor = K.ButtonColour.topRowOperations
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.addTarget(self, action: #selector(nonNumberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let divisionButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Operation.division, for: .normal)
        button.backgroundColor = K.ButtonColour.rightColumnOperations
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.bigger)
        button.setTitleColor(K.ButtonColour.background, for: .normal)
        button.addTarget(self, action: #selector(nonNumberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Second Row
    
    private let secondRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let numberSevenButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Number.seven, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let numberEightButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Number.eight, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let numberNineButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Number.nine, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let multiplyButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Operation.multiply, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.bigger)
        button.backgroundColor = K.ButtonColour.rightColumnOperations
        button.setTitleColor(K.ButtonColour.background, for: .normal)
        button.addTarget(self, action: #selector(nonNumberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Third Row
    
    private let thirdRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let numberFourButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Number.four, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let numberFiveButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Number.five, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let numberSixButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Number.six, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let substractionButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Operation.minus, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.bigger)
        button.backgroundColor = K.ButtonColour.rightColumnOperations
        button.setTitleColor(K.ButtonColour.background, for: .normal)
        button.addTarget(self, action: #selector(nonNumberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Fourth Row
    private let fourthRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let numberOneButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Number.one, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let numberTwoButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Number.two, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let numberThreeButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Number.three, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let additionButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Operation.plus, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.bigger)
        button.backgroundColor = K.ButtonColour.rightColumnOperations
        button.setTitleColor(K.ButtonColour.background, for: .normal)
        button.addTarget(self, action: #selector(nonNumberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Fifth Row
    
    private let fifthRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let numberZeroButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Number.zero, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let dotEqualStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let dotButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.SpecialSign.dot, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.normal)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let equalButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.Operation.equal, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: K.FontSize.bigger)
        button.backgroundColor = K.ButtonColour.rightColumnOperations
        button.setTitleColor(K.ButtonColour.background, for: .normal)
        button.addTarget(self, action: #selector(nonNumberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Main Stack View
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 1
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAllComponentsToMainView()
    }
    
    //MARK: - Add all components to main view
    
    private func addAllComponentsToMainView() {
        addBackgroundView()
        addTextLabel()
        addFirstStackView()
        addSecondStackView()
        addThirdStackView()
        addFouthStackView()
        addDotEqualStackView()
        addFifthStackView()
        addMainStackView()
    }
    
    private func addBackgroundView() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(150)
        }
    }
    
    private func addTextLabel() {
        backgroundView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.left.equalTo(backgroundView.snp.left).offset(10)
            make.right.equalTo(backgroundView.snp.right).offset(-10)
            make.bottom.equalTo(backgroundView.snp.bottom).offset(10)
            make.height.equalTo(100)
        }
    }
    
    private func addFirstStackView() {
        let items = [ACButton, plusMinusButton, percentageButton, divisionButton]
        for item in items{
            firstRowStackView.addArrangedSubview(item)
        }
    }
    
    private func addSecondStackView() {
        let items = [numberSevenButton, numberEightButton, numberNineButton, multiplyButton]
        for item in items{
            secondRowStackView.addArrangedSubview(item)
        }
    }
    
    private func addThirdStackView() {
        let items = [numberFourButton, numberFiveButton, numberSixButton, substractionButton]
        for item in items{
            thirdRowStackView.addArrangedSubview(item)
        }
    }
    
    private func addFouthStackView() {
        let items = [numberOneButton, numberTwoButton, numberThreeButton, additionButton]
        for item in items{
            fourthRowStackView.addArrangedSubview(item)
        }
    }
    
    private func addDotEqualStackView() {
        let items = [dotButton, equalButton]
        for item in items {
            dotEqualStackView.addArrangedSubview(item)
        }
    }
    
    private func addFifthStackView() {
        let items = [numberZeroButton, dotEqualStackView]
        for item in items {
            fifthRowStackView.addArrangedSubview(item)
        }
    }
    
    private func addMainStackView() {
        view.addSubview(mainStackView)
        let items = [firstRowStackView, secondRowStackView, thirdRowStackView, fourthRowStackView, fifthRowStackView]
        for item in items {
            mainStackView.addArrangedSubview(item)
        }
        mainStackView.snp.makeConstraints{ make in
            make.top.equalTo(backgroundView.snp.bottom).offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
        }
    }
    
    //MARK: - Functions
    
    @objc private func nonNumberButtonPressed(sender: UIButton!) {
            isFinishedTyping = true
            isDotUsed = false
            calculatorManager.setValue(valueOnTextLabel)
        
            if let nonNumber = sender.currentTitle, let result = calculatorManager.calculate(operation: nonNumber)  {
            valueOnTextLabel = result
            }
    }
    
    @objc private func numberButtonPressed(sender: UIButton!) {
        if let numberValue = sender.currentTitle {
            
            if isFinishedTyping == true {
                // we don't want to start with "."
                if numberValue == K.SpecialSign.dot {
                   return
                }
                textLabel.text = numberValue
                isFinishedTyping = false
                
            // when we have first char this else statement starts:
            } else if isDotUsed == true {
                    // We dont want to use "." second time
                if numberValue != K.SpecialSign.dot {
                        textLabel.text = textLabel.text! + numberValue
                    } else {
                        return
                    }
             
            } else {
                    // isDotUsed == false. This is our first "."
                if numberValue == K.SpecialSign.dot {
                        isDotUsed = true
                    }
                    textLabel.text = textLabel.text! + numberValue
            }
        }

    }
    
}
