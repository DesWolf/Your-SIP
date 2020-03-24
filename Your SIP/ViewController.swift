//
//  ViewController.swift
//  Passive Money
//
//  Created by Максим Окунеев on 12/8/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AlertWrongData {

    @IBOutlet var ageLabel: UITextField!
    @IBOutlet var retAgeLabel: UITextField!
    @IBOutlet var sumLabel: UITextField!
    @IBOutlet var percentLabel: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var calculateButton: UIButton!

    var age = 27
    var retAge = 45
    var sum = 100
    var percent = 5
    var result = 0
    let checkData = CheckData()
    let calculation = Calculations()

    override func viewDidLoad() {
        super.viewDidLoad()

        checkData.delegate = self

        calculateButton.layer.cornerRadius = calculateButton.frame.size.height / 2

        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolbar.setItems([flexSpace, doneButton], animated: true)

        ageLabel.inputAccessoryView = toolbar
        retAgeLabel.inputAccessoryView = toolbar
        sumLabel.inputAccessoryView = toolbar
        percentLabel.inputAccessoryView = toolbar
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func agePlus(_ sender: Any) {
        ageLabel.text = String(checkData.fullCheck(identifier: "age", number: ageLabel.text!, sign: "+"))
    }

    @IBAction func ageMinus(_ sender: Any) {
        ageLabel.text = String(checkData.fullCheck(identifier: "age", number: ageLabel.text!, sign: "-"))
    }

    @IBAction func retirementAgePlus(_ sender: Any) {
        retAgeLabel.text = String(checkData.fullCheck(identifier: "retAge", number: retAgeLabel.text!, sign: "+"))
    }

    @IBAction func retirementAgeMinus(_ sender: Any) {
        retAgeLabel.text = String(checkData.fullCheck(identifier: "retAge", number: retAgeLabel.text!, sign: "-"))
    }

    @IBAction func sumPlus(_ sender: Any) {
        sumLabel.text = "\(checkData.fullCheck(identifier: "sum", number: sumLabel.text!, sign: "+"))$"
    }

    @IBAction func sumMinus(_ sender: Any) {
        sumLabel.text = "\(checkData.fullCheck(identifier: "sum", number: sumLabel.text!, sign: "-"))$"
    }

    @IBAction func persentPlus(_ sender: Any) {
        percentLabel.text = "\(checkData.fullCheck(identifier: "percent", number: percentLabel.text!, sign: "+"))%"
    }

    @IBAction func percentMinus(_ sender: Any) {
        percentLabel.text = "\(checkData.fullCheck(identifier: "percent", number: percentLabel.text!, sign: "-"))%"
    }

    @IBAction func calculate(_ sender: Any) {
        resultLabel.text = calculation.calculate(age: ageLabel.text!, retirementAge: retAgeLabel.text!,
                                                  sum: sumLabel.text!, percent: percentLabel.text!)
    }

    func alertWrongData() {
        let alert = UIAlertController(title: "Ошибка!",
                                      message: "Невозможно рассчитать. Пожалуйста, измените значение.",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in }))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: Extension
extension ViewController: UITextFieldDelegate {

    @objc func textFieldDidChange(textField: UITextField) {
    }

    @objc func doneAction() {

        if ageLabel.isEditing {
            ageLabel.text = String(checkData.fullCheck(identifier: "age", number: ageLabel.text!, sign: ""))
        } else if retAgeLabel.isEditing {
            retAgeLabel.text = String(checkData.fullCheck(identifier: "retAge", number: retAgeLabel.text!, sign: ""))
        } else if  sumLabel.isEditing {
            sumLabel.text = "\(checkData.fullCheck(identifier: "sum", number: sumLabel.text!, sign: ""))$"
        } else if percentLabel.isEditing {
            percentLabel.text = "\(checkData.fullCheck(identifier: "percent", number: percentLabel.text!, sign: ""))%"
        }

        view.endEditing(true)
    }
}
