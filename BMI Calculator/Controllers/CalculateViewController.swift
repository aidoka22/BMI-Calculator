//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculaterBrain = CalculaterBrain()
    
    @IBOutlet weak var HeightUISlider: UISlider!
    @IBOutlet weak var WeightUISlider: UISlider!

    @IBOutlet weak var HeightLabel: UILabel!
    @IBOutlet weak var WeightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeSlider(_ sender: UISlider) {
        let height = String( format: "%.2f" , sender.value )
        HeightLabel.text = "\(height)m"
    }
    
    @IBAction func WeightSliderchanged(_ sender: UISlider) {
        let weight = String( format: "%.0f" , sender.value )
        WeightLabel.text = "\(weight)Kg"
    }
    @IBAction func CalculateBMI(_ sender: UIButton) {
        let heightValue = HeightUISlider.value
        let weightValue = WeightUISlider.value
        calculaterBrain.calculateBMI(height: heightValue , weight: weightValue)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationCV = segue.destination as! ResultViewController
            destinationCV.bmiValue = calculaterBrain.getBMIValue()
            destinationCV.advice = calculaterBrain.getAdvice()
            destinationCV.color = calculaterBrain.getColor()
        }
    }
}

