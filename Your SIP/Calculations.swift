//
//  Calculations.swift
//  Your SIP
//
//  Created by Максим Окунеев on 1/26/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

struct Calculations {
    
   let checkData = CheckData()
    
    func separatedNumber(_ number: Any) -> String {
        guard let itIsANumber = number as? NSNumber else { return "Not a number" }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "

        return formatter.string(from: itIsANumber)!
    }

    func calculate(age:String, retirementAge: String, sum: String, percent: String) -> (String) {

        var i = 0
        let ageInt = checkData.stringToInt(str: age)
        let retirementAgeInt = checkData.stringToInt(str: retirementAge)
        let sumInt = checkData.stringToInt(str: sum)
        let percentInt = checkData.stringToInt(str: percent)

        let realPersent = (pow(1 + (Double(percentInt) / 100.0), 1.0/12.0) - 1) * 100
        var result = 0.0

        while i <= (retirementAgeInt - ageInt) * 12 - 1 {
            result = (result + Double(sumInt) ) * (1 + realPersent / 100)
            i = i + 1
        }

        return  "\(separatedNumber(Int(result))) $"
    }
}
