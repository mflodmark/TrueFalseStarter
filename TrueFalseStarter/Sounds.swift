//
//  Sounds.swift
//  TrueFalseStarter
//
//  Created by Markus Flodmark on 2017-01-15.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import AudioToolbox

var gameSound: SystemSoundID = 0
var Yes: SystemSoundID = 0
var No: SystemSoundID = 0


func loadGameStartSound() {
    let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
}

func playGameStartSound() {
    AudioServicesPlaySystemSound(gameSound)
}

func correctAnswerSound() {
    // Load sound
    let pathToSoundFile = Bundle.main.path(forResource: "Yes", ofType: "m4a")
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &Yes)
    
    // Play sound
    AudioServicesPlaySystemSound(Yes)
}

func incorrectAnswerSound() {
    // Load sound
    let pathToSoundFile = Bundle.main.path(forResource: "No", ofType: "m4a")
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &No)
    
    // Play sound
    AudioServicesPlaySystemSound(No)
}
