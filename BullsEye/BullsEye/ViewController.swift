//
//  ViewController.swift
//  BullsEye
//
//  Created by Admin on 23.09.2018.
//  Copyright © 2018 prokudin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentSliderValue: Int = 0
    var targetValue: Int = 0
    var currentRound: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        var diff = targetValue - currentSliderValue
        if (diff < 0) {
            diff *= -1
        }
        let message = "Current slider value: \(currentSliderValue)\n" +
                        "Target value: \(targetValue)\n" +
                        "Difference: \(diff)"
        let alert = UIAlertController(title: "Slider value", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentSliderValue = Int(slider.value.rounded())
    }
    
    func startNewRound() {
        currentRound = currentRound + 1
        roundLabel.text = "\(currentRound)"
        
        targetValue = Int.random(in: 1...100)
        targetLabel.text = "\(targetValue)"
        
        slider.value = Float(50)
        sliderMoved(slider)
    }
}
