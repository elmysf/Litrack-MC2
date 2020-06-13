//
//  SpeechService.swift
//  Litrack-MC2
//
//  Created by Karina Widyastuti on 13/06/20.
//  Copyright © 2020 Karina Widyastuti. All rights reserved.
//

import AVFoundation
import UIKit

class SpeechService{
    
    let speechSynthizer = AVSpeechSynthesizer()
    
    func speaking(_ phrase: String){
        
        guard UIAccessibility.isVoiceOverRunning else {
            return
        }
        
        let utterance = AVSpeechUtterance(string: phrase)
        let languageCode = "en-EN".localized
        utterance.voice = AVSpeechSynthesisVoice(language: languageCode)
        speechSynthizer.speak(utterance)
    }
}

extension String{
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
