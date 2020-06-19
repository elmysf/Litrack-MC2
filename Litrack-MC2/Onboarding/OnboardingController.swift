//
//  OnboardingController.swift
//  Litrack-MC2
//
//  Created by Karina Widyastuti on 12/06/20.
//  Copyright © 2020 Karina Widyastuti. All rights reserved.
//

import UIKit
import SwiftyGif

class OnboardingController: UIViewController {
     
    let logoAnimationView = LogoAnimationView()
     @IBOutlet weak var welcome: UILabel!
     @IBOutlet weak var getStarted: UIButton!
     @IBOutlet weak var image1: UIImageView!
     @IBOutlet weak var label1: UILabel!
     @IBOutlet weak var image2: UIImageView!
     @IBOutlet weak var label2: UILabel!
     @IBOutlet weak var image3: UIImageView!
     @IBOutlet weak var label3: UILabel!
     @IBOutlet weak var stackViewCollect: UIStackView!
     @IBOutlet weak var stackView1: UIStackView!
     @IBOutlet weak var stackView2: UIStackView!
     @IBOutlet weak var stackView3: UIStackView!
    
//    let speechService = SpeechService()
    
     override func viewDidLoad() {
         super.viewDidLoad()
             view.addSubview(logoAnimationView)
             logoAnimationView.pinEdgesToSuperView()
             logoAnimationView.logoGifImageView.delegate = self
        
         // setup welcome
            let fontWelcome = UIFont.boldSystemFont(ofSize: 60)
            welcome.font = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: fontWelcome)
            welcome.text = "Welcome"
            welcome.textAlignment = .center
            welcome.adjustsFontForContentSizeCategory = true
            welcome.frame.origin.y += UIFontMetrics.default.scaledValue(for: 60.0)
   
        //
                // setup stack view
            let fontLabel = UIFont.systemFont(ofSize: 20)

            image1.image = UIImage(named: "Onboarding 1st Icon")
            image1.adjustsImageSizeForAccessibilityContentSizeCategory = true
            label1.text = "Add your waste with the camera feature"
            label1.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: fontLabel)
            label1.adjustsFontForContentSizeCategory = true
            image2.image = UIImage(named: "Onboarding 2nd Icon")
            image2.adjustsImageSizeForAccessibilityContentSizeCategory = true
            label2.text = "Get data and track your waste production"
            label2.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: fontLabel)
            label2.adjustsFontForContentSizeCategory = true
            image3.image = UIImage(named: "Onboarding 3rd Icon")
            image3.adjustsImageSizeForAccessibilityContentSizeCategory = true
            label3.text = "Get tips on how to reduce and recycle it"
            label3.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: fontLabel)
            label2.adjustsFontForContentSizeCategory = true
            
            // setup button
            let fontButton = UIFont.systemFont(ofSize: 22)
            getStarted.setTitle("Get Started", for: .normal)
            getStarted.backgroundColor = UIColor(red: 59/255, green: 126/255, blue: 115/255, alpha: 1)
            getStarted.setTitleColor(.white, for: .normal)
            getStarted.titleLabel?.font = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: fontButton)
            getStarted.layer.cornerRadius = 10
            getStarted.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
         }
  
       
    
    @IBAction func getStarted(_ sender: Any) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        UserDefaults.standard.set(true, forKey: "hasLaunched")
        let storyboard = UIStoryboard(name: "Camera.Screen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "main") as! CameraController
//        UIApplication.shared.keyWindow?.rootViewController = vc
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
//        self.present(vc, animated: true, completion: { () -> Void in
//            self.dismiss(animated: false, completion: nil)
//        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // add gif in lauchscreen
        logoAnimationView.logoGifImageView.startAnimatingGif()
        
        // add voice over
//        let welcomeOnboarding = "welcome onboarding".localized
//        speechService.speaking(welcomeOnboarding)
    }
}
extension OnboardingController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        logoAnimationView.isHidden = true
    }
}
