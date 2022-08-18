//
//  CalculaterBrain.swift
//  BMI Calculator
//
//  Created by Айдана Шарипбай on 17.08.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculaterBrain{
    
    private var bmi : BMI?
    
    mutating func calculateBMI(height: Float , weight : Float ){
        let bmiValue = weight / pow( height ,2)
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fir as a fiddle", color: .green)
        } else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: .red)
        }
        
    }
    
    func getBMIValue() -> String{
        let BMIToDecimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return BMIToDecimal
    }
    
    func getAdvice() -> String {
        let advice :String =  bmi?.advice ?? ""
        return advice
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? .white
    }
}
