//
//  ViewController.swift
//  DeuCalculator
//
//  Created by admin on 28.03.2020.
//  Copyright © 2020 og. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var holder: UIView!
    @IBOutlet weak var screenLabel: UILabel!
    @IBOutlet weak var ACButton: UIButton!
    
    private var previusPressedOperationButton: UIButton!
    var firstNumber: String=""
    var secondNumber: String=""
    var prevOperation: String=""
    var pressedNumber: String=""
    var isFirstNumber: Bool=true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenLabel.text = "0"
    }
    
    @IBAction func buttonComma(_ sender: Any) {
        if(isFirstNumber && !firstNumber.contains(".")){
            screenLabel.text = firstNumber + ","
            firstNumber += "."
        }else if(!isFirstNumber && !secondNumber.contains(".")){
            if(secondNumber != ""){
                screenLabel.text = secondNumber + ","
                secondNumber += "."
            }else{
                secondNumber = "0."
                screenLabel.text = secondNumber.replacingOccurrences(of: ".", with: ",")
            }
        }
    }
    
    @IBAction func buttonInverter(_ sender: Any) {
        if(secondNumber == ""){
            if(firstNumber.first != "-"){
                firstNumber = "-" + firstNumber
            }else{
                firstNumber = firstNumber.replacingOccurrences(of: "-", with: "")
            }
            screenLabel.text = firstNumber.replacingOccurrences(of: ".", with: ",")
        }else{
            if(secondNumber.first != "-"){
                secondNumber = "-" + secondNumber
            }else{
                firstNumber = secondNumber.replacingOccurrences(of: "-", with: "")
            }
            screenLabel.text = secondNumber.replacingOccurrences(of: ".", with: ",")
        }
    }
    
    @IBAction func numberPressed(_ numberButton: UIButton) {
        
        pressedNumber = numberButton.currentTitle!
        
        if(isFirstNumber){
            firstNumber += pressedNumber
            screenLabel.text! = firstNumber.replacingOccurrences(of: ".", with: ",")
        }else{
            secondNumber+=pressedNumber
            screenLabel.text! = secondNumber.replacingOccurrences(of: ".", with: ",")
        }
    }
    
    @IBAction func operationPressed(_ operationButton: UIButton) {
        let currentOperation = operationButton.currentTitle!
        
        if(!(firstNumber == "" && secondNumber == "") )
        {
            // Second number is empty
            if (isFirstNumber) {
                // Switch first number to second number
                isFirstNumber = false
                // Both first and second numbers are filled
            }else if(secondNumber != ""){
                if(firstNumber.last == "."){
                    firstNumber += "0"
                }else if(secondNumber.last == "."){
                    secondNumber += "0"
                }
                
                calculate(num1: firstNumber, num2: secondNumber, operation: prevOperation)
            }
            
            if(currentOperation != "="){
                prevOperation = operationButton.currentTitle!
            }
        }
    }
    
    @IBAction func ACPressed(_ ACButton: UIButton) {
        if ACButton.currentTitle=="AC"{
            screenLabel.text = "0"
            firstNumber=""
            secondNumber=""
            pressedNumber=""
            isFirstNumber = true;
            cleanMemory()
        }else if ACButton.currentTitle=="C"{
            screenLabel.text = "0"
        }else {
            //ERROR
            screenLabel.textColor=UIColor.red
            screenLabel.text = "ERROR: unknow AC/C button"
        }
        
    }
    
    private func cleanMemory(){
        //ilerde gecmis islemler silinecek
        //suanda gecmis islemler tutulmadigi icin farketmiyor
    }
    
    private func calculate(num1: String, num2: String, operation: String){
        // operation-> (X - + ÷)
        if operation=="X" {
            firstNumber = String(Double(num1)! * Double(num2)!)
        }else if operation=="-" {
            firstNumber = String(Double(num1)! - Double(num2)!)
        }else if operation=="+" {
            firstNumber = String(Double(num1)! + Double(num2)!)
        }else if operation=="÷" {
            firstNumber = String(Double(num1)! / Double(num2)!)
        }else {
            //ERROR
            screenLabel.textColor=UIColor.red
            screenLabel.text = "ERROR: unknow operation"
        }
        let seperated = firstNumber.split(separator: ".")
        let leftHandSide = String(seperated[0])
        let rightHandSide = String(seperated[1])
        
        if(rightHandSide == "0"){
            firstNumber = leftHandSide
            screenLabel.text = leftHandSide
        }
        else{
            screenLabel.text = firstNumber.replacingOccurrences(of: ".", with: ",")
        }
        secondNumber = ""
    }
}
