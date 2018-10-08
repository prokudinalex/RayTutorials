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
        startOver()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHigh = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHigh, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftImageResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftImageResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightImageResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightImageResizable, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let diff = abs(targetValue - currentSliderValue)
        let points = calculatePoints(diff: diff)
        let title = getTitle(diff: diff)
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentSliderValue = Int(slider.value.rounded())
    }
    
    @IBAction func startOver() {
        currentRound = 0;
        score = 0;
        startNewRound()
    }
    
    func calculatePoints(diff: Int) -> Int {
        var points = 100 - diff
        if (0 == diff) {
            points += 100
        } else if (1 == diff) {
            points += 50
        }
        score += points
        return points
    }
    
    func getTitle(diff: Int) -> String {
        let title: String
        if (0 == diff) {
            title = "Perfect!"
        } else if (5 > diff) {
            title = "You almost had it!"
        } else if (10 > diff) {
            title = "Pretty good"
        } else {
            title = "Not even close..."
        }
        return title
    }
    
    func startNewRound() {
        currentRound = currentRound + 1
        targetValue = Int.random(in: 1...100)
        slider.value = Float(50)
        sliderMoved(slider)
        updateLabels()
    }
    
    func updateLabels() {
        roundLabel.text = "\(currentRound)"
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(score)"
    }
}
