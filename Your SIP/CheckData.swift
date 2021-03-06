//
//  Calculations.swift
//  Passive Money
//
//  Created by Максим Окунеев on 12/13/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import UIKit

protocol AlertWrongData: AnyObject {
    func alertWrongData()
}

class CheckData {

    let limits = Limits()
    weak var delegate: AlertWrongData?

    func plusMinusElement(sign: String) -> Int {

        if sign == "+" {
            return 1
        } else if sign == "-" {
            return -1
        }
        return 0
    }

    func stringToInt(str: String) -> (Int) {

        var str = str
        var res = 0

        if str == "" {
            return 0
        } else {
            let char: Set<Character> = ["$", " ", "%"]
            str.removeAll(where: {char.contains($0) })

            res = Int(str)!
        }

    return(res)
    }

    func fullCheck(identifier: String, number: String, sign: String) -> Int {

        let correctNumber = stringToInt(str: number)
        var action = 0
        var result = 0

        if sign == "" {
            action = 0
        } else {
            action = plusMinusElement(sign: sign)
        }

        if identifier == "sum" {
            action *= 100
        }

        if limits.checkMinMax(identifier: identifier, number: correctNumber, sign: sign) == false {
            delegate?.alertWrongData()
            result = correctNumber
        } else {
            result = correctNumber + action
        }

        return result
    }
}
