//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime: [String : Int] = ["Soft": 5, "Medium": 420, "Hard": 720]
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var appLabel: UILabel!
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        appLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
         
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            appLabel.text = "Done!"
        }
        
    }
    
}
