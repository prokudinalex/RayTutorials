//
//  ViewController.swift
//  BullsEye
//
//  Created by Admin on 23.09.2018.
//  Copyright © 2018 prokudin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentSliderValue = 0
    var targetValue = 0
    var currentRound = 0
    var score = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let diff = abs(targetValue - currentSliderValue)
        let points = 100 - diff
        score += points
        
        let message = "You scored \(points) points"
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
        
        scoreLabel.text = "\(score)"
        
        slider.value = Float(50)
        sliderMoved(slider)
    }
}
