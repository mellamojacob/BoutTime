//
//  Sounds.swift
//  Bout Time
//
//  Created by Jacob Virgin on 8/10/16.
//  Copyright © 2016 Jacob Virgin. All rights reserved.
//

import Foundation
import AudioToolbox

var correctDing: SystemSoundID = 0
var incorrectBuzz: SystemSoundID = 0

func loadCorrectDing() {
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("CorrectDing", ofType: "wav")
    let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL, &correctDing)
}

func playCorrectDing() {
    AudioServicesPlaySystemSound(correctDing)
}

func loadIncorrectBuzz() {
    let pathToSoundFile = NSBundle.mainBundle().pathForResource("IncorrectBuzz", ofType: "wav")
    let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL, &incorrectBuzz)
}

func playIncorrectBuzz() {
    AudioServicesPlaySystemSound(incorrectBuzz)
}


