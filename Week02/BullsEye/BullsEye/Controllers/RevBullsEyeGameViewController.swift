//
//  RevBullsEyeGameViewController.swift
//  BullsEye
//
//  Created by Chun Wu on 2020-06-08.
//  Copyright © 2020 Ray Wenderlich. All rights reserved.
//

import UIKit

class RevBullsEyeGameViewController: UIViewController {

    let revBullsEyeGame = BullsEyeGame()
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var hitMe: UIButton!
    @IBOutlet weak var startOver: UIButton!
    
    public func updateView() {
        slider.value = Float(revBullsEyeGame.targetValue)
        userInput.text = String(revBullsEyeGame.sliderValue)
        scoreLabel.text = String(revBullsEyeGame.score)
        roundLabel.text = String(revBullsEyeGame.round)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        slider.isEnabled = false
    }
}
