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
  var pressedNumber: String=""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    screenLabel.text = "0"
  }
  
  @IBAction func numberPressed(_ numberButton: UIButton) {
    pressedNumber=numberButton.currentTitle!
    ACButton.titleLabel!.text="C"
    if firstNumber == "" { //before operation
      if screenLabel.text=="0" { //ilk sayi basma
        screenLabel.text=pressedNumber
      }else{ //sayinin yanina sayi ekleme
        screenLabel.text!+=pressedNumber
      }
    }else { //after operation
      if screenLabel.text==firstNumber {
        screenLabel.text=pressedNumber //operasyondan sonraki ilk sayi basma
      }else {
        screenLabel.text!+=pressedNumber //operasyondan sonra yanina sayi ekleme
      }
    }
  }
  
  @IBAction func operationPressed(_ operationButton: UIButton) {
    if operationButton.currentTitle == "+/-" {
      screenLabel.text = String(Double(screenLabel.text!)! * -1.0)
      return
    }
    if operationButton.currentTitle == "%" {
      screenLabel.text = String(Double(screenLabel.text!)! / 100.0)
      return
    }
    
    // button border
    if previusPressedOperationButton != operationButton{
      previusPressedOperationButton?.layer.borderWidth=0
    }
    operationButton.layer.borderWidth=1.3
    
    // calculate
    if screenLabel.text! != "" {
      if firstNumber == ""{ //ilk operasyon
        firstNumber=screenLabel.text!
        previusPressedOperationButton = operationButton
      }else { //ikinci operasyon
        if operationButton.currentTitle == "=" { //if operationButton = ise previusPressedOperationButton ile
          secondNumber=screenLabel.text!
          calculate(num1: firstNumber,num2: secondNumber,operation: previusPressedOperationButton.currentTitle!)
        }else { //else (X - + ÷) ise operationButton ile yap
          calculate(num1: firstNumber,num2: secondNumber,operation: operationButton.currentTitle!)
          previusPressedOperationButton = operationButton
        }
        screenLabel.text=firstNumber //sonucu(firstNumber) ekrana yaz
      }
    }
    
  }
  
  @IBAction func ACPressed(_ ACButton: UIButton) {
    if ACButton.currentTitle=="AC"{
      screenLabel.text = "0"
      firstNumber=""
      secondNumber=""
      pressedNumber=""
      pressedNumber=""
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
  }
  
  
  
  
  
}
