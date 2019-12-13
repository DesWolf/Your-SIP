//
//  Calculations.swift
//  Passive Money
//
//  Created by Максим Окунеев on 12/13/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import Foundation

struct Calculate {
    
    func result(age: Int, retirementAge: Int, sum: Int, persent: Int) -> Double{
        
        var i = 0
        let realPersent = (pow(1 + (Double(persent) / 100.0), 1.0/12.0) - 1) * 100
         var result = 0.0

         while i <= (retirementAge - age) * 12 - 1 {
             result = (result + Double(sum) ) * (1 + realPersent / 100)
             i = i + 1
         }
        return (result)
}
}
