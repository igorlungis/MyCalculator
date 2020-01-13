//
//  ViewController.swift
//  MyCalculator
//
//  Created by Igor Lungis on 1/9/20.
//  Copyright © 2020 Igor Lungis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var additionalLabel: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var resultButton: UIButton!
    
    var numberScreen = 0.0
    var num1 = 0.0
    var sign = false
    var operation = 0
    var wasCalculated = false
    override func viewDidLoad() {
        super.viewDidLoad()
        resultButton.layer.cornerRadius = 17
        resultButton.layer.borderWidth = 3
        resultButton.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func dotAct(_ sender: Any) {
        if sign == false && result.text != "" {
            result.text = result.text! + "."
        }
    }
    
    @IBAction func nulAct(_ sender: UIButton) {
        if sign == false {
            if result.text != "0" && result.text != "00" {
                switch sender.tag {
                case 1: result.text = result.text! + "0"
                case 2: if result.text != "" {
                        result.text = result.text! + "00" }
                default: break
                }
            }} else {
            if sender.tag == 1 {
                result.text = "0"
                sign = false
            }
        }
        numberScreen = Double(result.text!)!
    }
    
    @IBAction func digitAct(_ sender: UIButton) {
        if wasCalculated == true {
            additionalLabel.text = ""
            wasCalculated = false
        }
        if sign == true {
            additionalLabel.text = additionalLabel.text! + result.text!
            result.text = String(sender.tag)
            sign = false
        } else {
            result.text = result.text! + String(sender.tag)
        }
        numberScreen = Double(result.text!)!
    }
    
    @IBAction func operationAct(_ sender: UIButton) {
        if result.text != "" && sender.tag != 5 && sender.tag != 6 {
            if Double(result.text!) != nil {
                num1 = Double(result.text!)!
                additionalLabel.text = result.text
            }
            switch sender.tag {
            case 1: result.text = "/"
            case 2: result.text = "*"
            case 3: result.text = "-"
            case 4: result.text = "+"
            default: break
            }
            sign = true
            operation = sender.tag
            } else if sender.tag == 5 && wasCalculated == false {
            additionalLabel.text = additionalLabel.text! + result.text!
            sign = true
            wasCalculated = true
                switch operation {
                case 1: result.text = String(num1 / numberScreen)
                case 2: result.text = String(num1 * numberScreen)
                case 3: result.text = String(num1 - numberScreen)
                case 4: result.text = String(num1 + numberScreen)
                default: break
                }
            
            for _ in result.text!.indices {
                if result.text![result.text!.index(before: result.text!.endIndex)] == "0" || result.text![result.text!.index(before: result.text!.endIndex)] == "." {
                    result.text!.removeLast()
                }
                
            }
        } else if sender.tag == 6 {
            result.text = ""
            additionalLabel.text = ""
            numberScreen = 0
            num1 = 0
            operation = 0
        }
    }
    

}

