//
//  BullsEyeGame.swift
//  BullsEye
//
//  Created by Chun Wu on 2020-06-07.
//  Copyright © 2020 Ray Wenderlich. All rights reserved.
//

import Foundation

public class BullsEyeGame {
    
    // Properties
    public var targetValue: Int!
    public var sliderValue: Int!
    public var score: Int!
    public var round: Int!
    
    init() {
        self.targetValue = Int.random(in: 1...100)
        self.score = 0
        self.round = 1
    }
    
    public func difference() -> Int {
        return abs(targetValue - sliderValue)
    }
    
    public func calculatePoints() -> Int {
        var points = 100 - difference()
        
        if difference() == 0 {
            points += 100
        } else if difference() < 5 {
            points += 50
        }
        
        score += points
        return points
    }
}
