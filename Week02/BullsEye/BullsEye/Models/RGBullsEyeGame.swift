//
//  RGBullsEyeGame.swift
//  BullsEye
//
//  Created by Chun Wu on 2020-06-08.
//  Copyright © 2020 Ray Wenderlich. All rights reserved.
//

import Foundation

public class RGBullsEyeGame {
        // Properties
        var sliderValue: RGB = RGB()
        var targetValue: RGB = RGB()
        public var score: Int = 0
        public var round: Int = 1
        
        init() {
            self.score = 0
            self.round = 1
        }

        func newRound() {
            targetValue = RGB()
            sliderValue = RGB()
            score += 1
        }
    
        public func difference() -> Double {
            let diff = sliderValue.difference(target: targetValue)
            return diff
        }
        
        public func calculatePoints() -> Int {
            var points = 100 - Int(difference())
            
            if difference() == 0 {
                points += 100
            } else if difference() < 5 {
                points += 50
            }
            
            score += points
            return points
        }
}
