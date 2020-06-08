//
//  BullsEyeGameViewController.swift
//  BullsEye
//
//  Created by Chun Wu on 2020-06-07.
//  Copyright © 2020 Ray Wenderlich. All rights reserved.
//

import UIKit

class BullsEyeGameViewController: UIViewController {

    // Instantiate Bullseye
    var bullsEyeGame = BullsEyeGame()
    
    // Instance Properties
    public var bullsEyeGameView: BullsEyeGameView! {
        guard isViewLoaded else {
            return nil
        }
        return (view as! BullsEyeGameView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bullsEyeGame.sliderValue = Int(bullsEyeGameView.slider.value)
        updateView()
    }
       
    public func updateView() {
        bullsEyeGameView.targetLabel.text = String(bullsEyeGame.targetValue)
        bullsEyeGameView.scoreLabel.text = String(bullsEyeGame.score)
        bullsEyeGameView.roundLabel.text = String(bullsEyeGame.round)
    }
    
    public func nextRound() {
        bullsEyeGame.round += 1
        updateView()
    }
            
    // Actions
    @IBAction func sliderMoved(_ sender: UISlider) {
        let sliderValue = sender.value.rounded()
        bullsEyeGame.sliderValue = Int(sliderValue)
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        bullsEyeGame = BullsEyeGame()
        updateView()
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let message = "You scored \(bullsEyeGame.calculatePoints())"
        
        if bullsEyeGame.difference() == 0 {
            title = "Perfect"
        } else if bullsEyeGame.difference() < 5 {
            title = "You almost had it!"
        } else if bullsEyeGame.difference() < 10 {
            title = "Pretty Good"
        } else  {
            title = "Not even close..."
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.nextRound()
            self.updateView()
        })
    
        alert.addAction(action)
    
        present(alert,animated: true,completion: nil)
    }
    
}
