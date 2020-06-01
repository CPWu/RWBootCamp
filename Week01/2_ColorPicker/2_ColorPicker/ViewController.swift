//
//  ViewController.swift
//  2_ColorPicker
//
//  Created by Chun Wu on 2020-05-31.
//  Copyright © 2020 Chun Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstColorValueLabel: UILabel!
    @IBOutlet weak var secondColorValueLabel: UILabel!
    @IBOutlet weak var thirdColorValueLabel: UILabel!
    
    @IBOutlet weak var firstColorLabel: UILabel!
    @IBOutlet weak var secondColorLabel: UILabel!
    @IBOutlet weak var thirdColorLabel: UILabel!
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    @IBOutlet weak var sliderOne: UISlider!
    @IBOutlet weak var sliderTwo: UISlider!
    @IBOutlet weak var sliderThree: UISlider!
    
    var valueOne: Int = 0
    var valueTwo: Int = 0
    var valueThree: Int = 0
    var userProvidedValue: String!
    var colorMode: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func modeDidChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            colorMode = 0;
            resetApplication()
        } else if sender.selectedSegmentIndex == 1 {
            colorMode = 1;
            resetApplication()
        } else {
            // Do Nothing
        }
    }
    
    @IBAction func firstSliderMoved(_ sender: UISlider) {
        valueOne = Int(sender.value)
        firstColorValueLabel.text = String(valueOne)
    }
    
    @IBAction func secondSliderMoved(_ sender: UISlider) {
        valueTwo = Int(sender.value)
        secondColorValueLabel.text = String(valueTwo)
    }
    
    @IBAction func thirdSliderMoved(_ sender: UISlider) {
        valueThree = Int(sender.value)
        thirdColorValueLabel.text = String(valueThree)
    }
    
    @IBAction func setColor(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Color Name", message: "What would you like to name this color?", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Color Name"
            textField.textAlignment = .center
        }
        let confirmAction = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
            self.userProvidedValue = alertController.textFields![0].text
            self.changeBackgroundColor()
            self.colorNameLabel.text = self.userProvidedValue
        }
        
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func resetAppPressed(_ sender: UIButton) {
        resetApplication()
    }
    
    func resetApplication() {
        if colorMode == 0 {
            firstColorLabel.text = "Red"
            secondColorLabel.text = "Green"
            thirdColorLabel.text = "Blue"
            sliderOne.maximumValue = 255
            sliderTwo.maximumValue = 255
            sliderThree.maximumValue = 255
        } else {
            firstColorLabel.text = "Hue"
            secondColorLabel.text = "Saturation"
            thirdColorLabel.text = "Brightness"
            sliderOne.maximumValue = 360
            sliderTwo.maximumValue = 100
            sliderThree.maximumValue = 100
        }
        firstColorValueLabel.text = "0"
        secondColorValueLabel.text = "0"
        thirdColorValueLabel.text = "0"
        sliderOne.value = 0;
        sliderTwo.value = 0;
        sliderThree.value = 0;
        colorNameLabel.text = ""
        view.backgroundColor = UIColor.white
    }
    
    func changeBackgroundColor() {
        if colorMode == 0 {
          view.backgroundColor = UIColor (red: (CGFloat(valueOne)/255.0), green: (CGFloat(valueTwo)/255.0), blue: (CGFloat(valueThree)/255.0), alpha: 1)
        } else {
           view.backgroundColor = UIColor (hue: (CGFloat(valueOne)/255.0), saturation: (CGFloat(valueTwo)/255.0), brightness: (CGFloat(valueThree)/255.0), alpha: 1)
        }
    }
}

