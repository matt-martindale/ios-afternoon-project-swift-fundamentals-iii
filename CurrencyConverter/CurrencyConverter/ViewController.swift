//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//types of currency we will convert
enum Currency {
    case cad
    case mxn
}
var currency: Currency = Currency.cad

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let currencyString =
            fromCurrencyTextField.text else { return }
        
        //checks if userInput is a valid number
        guard let currencyUSD = Double(currencyString) else {
            toCurrencyTextField.text = "Number Invalid"
            return
        }
        
        //checks which currency user selected and calculates proper conversion
        var currencyConverted: Double
        if cadButton.isSelected {
            currencyConverted = convertToCAD(currencyUSD)
        } else {
            currencyConverted = convertToMXN(currencyUSD)
        }
        
        toCurrencyTextField.text = convertDoubleToCurrency(amount: currencyConverted)
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {

        toCurrencyLabel.text = "Currency (CAD)"
        currency = Currency.cad
        //checks if currency selected is cad
        if cadButton.isSelected {} else {
            mxnButton.isSelected.toggle()
            cadButton.isSelected.toggle()
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {

        toCurrencyLabel.text = "Currency (MXN)"
        currency = Currency.mxn
        //checks if currency selected is mxn
        if mxnButton.isSelected {} else {
            cadButton.isSelected.toggle()
            mxnButton.isSelected.toggle()
        }
    }
    
    // MARK: - Helper Methods
    
    //converts US Dollars to Canadian Dollars
    func convertToCAD(_ dollars: Double) -> Double {
        let currencyConverted = dollars * 1.33
        return currencyConverted
    }
    
    //converts US Dollars to Mexican Pesos
    func convertToMXN(_ dollars: Double) -> Double {
        let currencyConverted = dollars * 19.70
        return currencyConverted
    }
    
    //converts doubles to currency string
    func convertDoubleToCurrency(amount: Double) -> String? {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
        
            return formatter.string(from: NSNumber(value: amount))
        }
    
}

