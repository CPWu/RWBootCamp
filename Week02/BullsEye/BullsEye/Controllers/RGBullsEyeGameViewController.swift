//
//  RGBullsEyeGameViewController.swift
//  BullsEye
//
//  Created by Chun Wu on 2020-06-08.
//  Copyright © 2020 Ray Wenderlich. All rights reserved.
//

import UIKit

class RGBullsEyeGameViewController: UIViewController {
    
    // Instantiate Bullseye
    var rgBullsEyeGame = RGBullsEyeGame()
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var targetTextLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    public func updateView() {
        redSlider.value = Float(rgBullsEyeGame.sliderValue.r)
        greenSlider.value = Float(rgBullsEyeGame.sliderValue.g)
        blueSlider.value = Float(rgBullsEyeGame.sliderValue.b)

        guessLabel.backgroundColor = UIColor(rgbStruct: rgBullsEyeGame.sliderValue)
        targetLabel.backgroundColor = UIColor(rgbStruct: rgBullsEyeGame.targetValue)
        print(UIColor(rgbStruct: rgBullsEyeGame.sliderValue))
        redLabel.text = "R \(rgBullsEyeGame.sliderValue.r)"
        greenLabel.text = "G \(rgBullsEyeGame.sliderValue.g)"
        blueLabel.text = "B \(rgBullsEyeGame.sliderValue.b)"
        
        roundLabel.text = "Round \(rgBullsEyeGame.round)"
        scoreLabel.text = "Score \(rgBullsEyeGame.score)"
        
        //blueSlider.minimumTrackTintColor = UIColor.blue.withAlphaComponent(CGFloat(rgBullsEyeGame.difference()/100.0))
        
    }
    
    public func nextRound() {
        rgBullsEyeGame.round += 1
        updateView()
    }
    
    
    @IBAction func aSliderMoved(_ sender: UISlider) {
        let red = Int(redSlider.value.rounded())
        let green = Int(greenSlider.value.rounded())
        let blue = Int(blueSlider.value.rounded())

        rgBullsEyeGame.sliderValue = RGB(r:red, g:green, b:blue)

        updateView()
    }
    
    
    @IBAction func showAlert(_ sender: UIButton) {

        let message = "You scored \(rgBullsEyeGame.calculatePoints())"
        if rgBullsEyeGame.difference() == 0 {
            title = "Perfect"
        } else if rgBullsEyeGame.difference() < 5 {
            title = "You almost had it!"
        } else if rgBullsEyeGame.difference() < 10 {
            title = "Pretty Good"
        } else  {
            title = "Not close..."
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
    
    @IBAction func startOver(_ sender: UIButton) {
        rgBullsEyeGame = RGBullsEyeGame()
        updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
}
