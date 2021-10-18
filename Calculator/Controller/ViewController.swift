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
    
    
    
    //MARK: - Text Label Section
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = K.ButtonColour.background
        return view
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "0"
        label.font = .systemFont(ofSize: 50)
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
        button.setTitle("AC", for: .normal)
        button.backgroundColor = K.ButtonColour.topRowOperations
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(nonNumberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let plusMinusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+/-", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.backgroundColor = K.ButtonColour.topRowOperations
        button.addTarget(self, action: #selector(nonNumberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let percentageButton: UIButton = {
        let button = UIButton()
        button.setTitle("%", for: .normal)
        button.backgroundColor = K.ButtonColour.topRowOperations
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(nonNumberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let divisionButton: UIButton = {
        let button = UIButton()
        button.setTitle("÷", for: .normal)
        button.backgroundColor = K.ButtonColour.rightColumnOperations
        button.titleLabel!.font = .systemFont(ofSize: 35)
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
        button.setTitle("7", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let numberEightButton: UIButton = {
        let button = UIButton()
        button.setTitle("8", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let numberNineButton: UIButton = {
        let button = UIButton()
        button.setTitle("9", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let multiplyButton: UIButton = {
        let button = UIButton()
        button.setTitle("×", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 35)
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
        button.setTitle("4", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let numberFiveButton: UIButton = {
        let button = UIButton()
        button.setTitle("5", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let numberSixButton: UIButton = {
        let button = UIButton()
        button.setTitle("6", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let substractionButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 35)
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
        button.setTitle("1", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let numberTwoButton: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let numberThreeButton: UIButton = {
        let button = UIButton()
        button.setTitle("3", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let additionButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 35)
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
        button.setTitle("0", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 30)
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
        button.setTitle(".", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 30)
        button.backgroundColor = K.ButtonColour.numbers
        button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let equalButton: UIButton = {
        let button = UIButton()
        button.setTitle("=", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 35)
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
        if let nonNumber = sender.currentTitle {
            let calculatorManager = CalculatorManager(value: valueOnTextLabel)
            guard let result = calculatorManager.calculate(operation: nonNumber) else {
                fatalError("calculate error")
            }
            valueOnTextLabel = result
        }
    }
    
    @objc private func numberButtonPressed(sender: UIButton!) {
        if let numberValue = sender.currentTitle {
            
            if isFinishedTyping == true {
                // we don't want to start with "."
                if numberValue == "." {
                   return
                }
                textLabel.text = numberValue
                isFinishedTyping = false
            // when we have first char this else statement starts:
            } else if isDotUsed == true {
                    // We dont want to use "." second time
                    if numberValue != "." {
                        textLabel.text = textLabel.text! + numberValue
                    } else {
                        return
                    }
             
            } else {
                    // isDotUsed == false. This is our first "."
                    if numberValue == "." {
                        isDotUsed = true
                    }
                    textLabel.text = textLabel.text! + numberValue
            }
        }

    }
    
}
