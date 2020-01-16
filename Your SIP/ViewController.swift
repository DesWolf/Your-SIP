//
//  ViewController.swift
//  Passive Money
//
//  Created by Максим Окунеев on 12/8/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ageLabel: UITextField!
    @IBOutlet var retirementAgeLabel: UITextField!
    @IBOutlet var sumLabel: UITextField!
    @IBOutlet var percentLabel: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var calculateButton: UIButton!
    
   
    @IBOutlet var gestureReconizer: UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sumLabel.textAlignment = .natural
        calculateButton.layer.cornerRadius = calculateButton.frame.size.height / 2
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([flexSpace, doneButton], animated: true)
        
        ageLabel.inputAccessoryView = toolbar
        retirementAgeLabel.inputAccessoryView = toolbar
        sumLabel.inputAccessoryView = toolbar
        percentLabel.inputAccessoryView = toolbar
      
    }
    
    var age = 27
    var retirementAge = 45
    var sum = 100
    var percent = 5
    var result = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func agePlus(_ sender: Any) {
        
        age = Int(ageLabel.text!) ?? 27
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
        
        age = Int(ageLabel.text!) ?? 27
        if age > 5 { age = age - 1 }
        ageLabel.text = String(age)
    }
    
    @IBAction func retirementAgePlus(_ sender: Any) {
        
        retirementAge = Int(retirementAgeLabel.text!) ?? 45
        if retirementAge < 100 { retirementAge = retirementAge + 1 }
        retirementAgeLabel.text = String(retirementAge)
    }
    
    @IBAction func retirementAgeMinus(_ sender: Any) {
    
        retirementAge = Int(retirementAgeLabel.text!) ?? 45
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
        
        sum = Int(sumLabel.text!) ?? 100
        if sumLabel.text!.last == "$" {
            let sumString = sumLabel.text!.dropLast()
        sum = Int(sumString)!
        }
        if  sum < 98000 { sum = sum + 100 }
        sumLabel.text = "\(sum)$"
    }

    @IBAction func sumMinus(_ sender: Any) {
        
        sum = Int(sumLabel.text!) ?? 100
        if sumLabel.text!.last == "$" {
                 let sumString = sumLabel.text!.dropLast()
             sum = Int(sumString)!
             }
        if  sum > 100 { sum = sum - 100 }
        sumLabel.text = "\(sum)$"
    }
    
    @IBAction func persentPlus(_ sender: Any) {
        
        percent = Int(percentLabel.text!) ?? 5
        if percentLabel.text!.last == "%" {
           let percentString = percentLabel.text!.dropLast()
            percent = Int(percentString)!
        }
        if percent < 30 { percent = percent + 1 }
        percentLabel.text = "\(percent)%"
        
    }
    @IBAction func percentMinus(_ sender: Any) {
        
        percent = Int(percentLabel.text!) ?? 5
        if percentLabel.text!.last == "%" {
           let percentString = percentLabel.text!.dropLast()
            percent = Int(percentString)!
        }
        if  percent > -5 { percent = percent - 1 }
        percentLabel.text = "\(percent)%"
    }
    
    @IBAction func calculate(_ sender: Any) {

        let age = standartCheckForLettersAndNil(str: ageLabel.text!)
        let retirementAge = standartCheckForLettersAndNil(str: retirementAgeLabel.text!)
        let sum = standartCheckForLettersAndNil(str: sumLabel.text!)
        let persent = standartCheckForLettersAndNil(str: percentLabel.text!)
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
        resultLabel.text = "\(separatedNumber(Int(result))) $"
    }
   
    private func alertWrongData() {
        let alert = UIAlertController(title: "Ошибка!",
                                      message: "Невозможно рассчитать. Пожалуйста, измените значение.",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: { _ in }))
        self.present(alert, animated: true, completion: nil)
    }
}
// MARK: Extension
extension ViewController: UITextFieldDelegate {



    @objc func textFieldDidChange(textField: UITextField){
    }

    @objc func doneAction(){
        
        var age = 0
        var retirementAge = 0
        var sum = 0
        var percent = 0
        
    //age
        age = standartCheckForLettersAndNil(str: ageLabel.text!)
        if (age < 5 || age > 100) {
            alertWrongData()
        }
        ageLabel.text = ("\(age)")
        
    //retirementAge
        retirementAge = standartCheckForLettersAndNil(str: retirementAgeLabel.text!)
        if (retirementAge < 20 || retirementAge > 115){
            if age > retirementAge {
            alertWrongData()
            }
        }
        retirementAgeLabel.text = ("\(retirementAge)")
        
    //sumLabel
        sum = standartCheckForLettersAndNil(str: sumLabel.text!)
        if (sum < 1 || sum > 99000) {
            alertWrongData()
        }
        sumLabel.text = ("\(sum)$")
        
    //percentLabel
        percent = standartCheckForLettersAndNil(str: percentLabel.text!)
        if (percent < 1 || percent > 100) {
        alertWrongData()
        }
        percentLabel.text = ("\(percent)%")
        
        view.endEditing(true)
        
    }

    func standartCheckForLettersAndNil (str:String) -> (Int){
      
        if str == "" {
            return 0
        } else if (str.last == "%" || str.last == "$"){
            return  (Int(str.dropLast())!)
        }
        else {
            return (Int(str)!)
        }
    }
}


