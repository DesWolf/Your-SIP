//
//  Limits.swift
//  Your SIP
//
//  Created by Максим Окунеев on 1/25/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

struct Limits {
    
    let ageMin = 0
    let ageMax = 100
    let retAgeMin = 20
    let retAgeMax = 115
    let sumMin = 1
    let sumMax = 99900
    let percentMin = 0
    let percentMax = 100
    
    func checkMinMax (identifier: String, number: Int, sign: String) -> Bool {
        
        switch identifier {
        case "age":
            if (((number <= ageMin) && (sign == "-")) ||
                ((number >= ageMax) && (sign == "+")) ||
                ((number <= ageMin) || (number >= ageMax) && (sign == ""))) {
                return false
            } else {
                return true
            }
        case "retAge":
            if (((number <= retAgeMin) && (sign == "-")) ||
                ((number >= retAgeMax) && (sign == "+")) ||
                ((number <= retAgeMin) || (number >= retAgeMax) && (sign == ""))) {
                return false
            } else {
                return true
            }
         case "sum":
            if (((number <= sumMin) && (sign == "-")) ||
                ((number >= sumMax) && (sign == "+")) ||
                ((number <= sumMin) || (number >= sumMax) && (sign == ""))) {
                return false
            } else {
                return true
            }
          case "percent":
            if (((number <= percentMin) && (sign == "-")) ||
                ((number >= percentMax) && (sign == "+")) ||
                ((number <= percentMin) || (number >= percentMax) && (sign == ""))) {
                return false
            } else {
                return true
            }
          
        default:
            return false
        }
    }
    
}
    

