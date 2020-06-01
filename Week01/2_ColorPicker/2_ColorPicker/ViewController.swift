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
    
    var valueOne: Int = 0
    var valueTwo: Int = 0
    var valueThree: Int = 0
    var userProvidedValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func modeDidChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            rgbMode()
        } else if sender.selectedSegmentIndex == 1 {
            hsbMode()
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
    
    func rgbMode() {
        firstColorLabel.text = "Red"
        secondColorLabel.text = "Green"
        thirdColorLabel.text = "Blue"
        firstColorValueLabel.text = "0"
        secondColorValueLabel.text = "0"
        thirdColorValueLabel.text = "0"
    }
    
    func hsbMode() {
        firstColorLabel.text = "Hue"
        secondColorLabel.text = "Saturation"
        thirdColorLabel.text = "Brightness"
        firstColorValueLabel.text = "0"
        secondColorValueLabel.text = "0"
        thirdColorValueLabel.text = "0"
    }
    
    func changeBackgroundColor() {
        view.backgroundColor = UIColor (red: (CGFloat(valueOne)/255.0), green: (CGFloat(valueTwo)/255.0), blue: (CGFloat(valueThree)/255.0), alpha: 1)
    }
}

