//
//  ViewController.swift
//  Passive Money
//
//  Created by Максим Окунеев on 12/8/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var retirementAgeLabel: UILabel!
    @IBOutlet var sumLabel: UILabel!
    @IBOutlet var persentLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sumLabel.textAlignment = .natural
        calculateButton.layer.cornerRadius = calculateButton.frame.size.height / 2
    }
    
    var age = 27
    var retirementAge = 45
    var sum = 100
    var persent = 5
    var result = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func agePlus(_ sender: Any) {
        
        if age < 100 {
            if retirementAge - age == 1 {
                retirementAge = retirementAge + 1
                age = age + 1
            } else{
                age = age + 1
            }
        }
        ageLabel.text = String(age)
        retirementAgeLabel.text = String(retirementAge)
    }
    
    @IBAction func ageMinus(_ sender: Any) {
        
        if age > 5 { age = age - 1 }
        ageLabel.text = String(age)
    }
    
    @IBAction func retirementAgePlus(_ sender: Any) {
        
        if retirementAge < 100 { retirementAge = retirementAge + 1 }
        retirementAgeLabel.text = String(retirementAge)
    }
    
    @IBAction func retirementAgeMinus(_ sender: Any) {
    
        if retirementAge > 30 {
            if retirementAge - age == 1 {
                age = age - 1
                retirementAge = retirementAge - 1
            } else {
            retirementAge = retirementAge - 1
            }
        }
        ageLabel.text = String(age)
        retirementAgeLabel.text = String(retirementAge)
    }
    
    @IBAction func sumPlus(_ sender: Any) {
        
        if  sum < 100000 { sum = sum + 100 }
        sumLabel.text = String(sum) 
    }

    @IBAction func sumMinus(_ sender: Any) {
        
        if  sum > 100 { sum = sum - 100 }
        sumLabel.text = String(sum)
    }
    
    @IBAction func persentPlus(_ sender: Any) {
        
        if persent < 30 { persent = persent + 1 }
        persentLabel.text = "\(persent)%"
        
    }
    @IBAction func percentMinus(_ sender: Any) {
        
        if  persent > -5 { persent = persent - 1 }
        persentLabel.text = "\(persent)%"
    }
    
    @IBAction func calculate(_ sender: Any) {

        var i = 0
        let realPersent = (pow(1 + (Double(persent) / 100.0), 1.0/12.0) - 1) * 100
        var result = 0.0

        while i <= (retirementAge - age) * 12 - 1 {
            result = (result + Double(sum) ) * (1 + realPersent / 100)
            i = i + 1
        }
        
        func separatedNumber(_ number: Any) -> String {
            guard let itIsANumber = number as? NSNumber else { return "Not a number" }
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = " "
        return formatter.string(from: itIsANumber)!
        }
        resultLabel.text = separatedNumber(Int(result))
    }
}


