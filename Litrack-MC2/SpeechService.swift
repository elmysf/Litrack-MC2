//
//  SpeechService.swift
//  Litrack-MC2
//
//  Created by Vioni Febiyanti on 11/06/20.
//  Copyright © 2020 Karina Widyastuti. All rights reserved.
//

import AVFoundation
import UIKit

class SpeechService{
    
    let speechSynthizer = AVSpeechSynthesizer()
    
    func say(_ phrase:String){
        
       guard UIAccessibility.isVoiceOverRunning else {
            return
        }
        
        let utterenece = AVSpeechUtterance(string: phrase)
        let langCode = "en-EN".localized
        utterenece.voice = AVSpeechSynthesisVoice(language: "id-ID")
        speechSynthizer.speak(utterenece)
    }
}

extension String{
    var localized : String{
        return NSLocalizedString(self, comment: "")
    }
}

