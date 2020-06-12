//
//  MainController.swift
//  Litrack-MC2
//
//  Created by Sufiandy Elmy on 30/05/20.
//  Copyright © 2020 Karina Widyastuti. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {
    
   @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var getStarted: UIButton!    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       // setup welcome
                let fontWelcome = UIFont.boldSystemFont(ofSize: 60)
                self.welcome.font = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: fontWelcome)
                self.welcome.text = "Welcome!"
                self.welcome.textAlignment = .center
                self.welcome.adjustsFontForContentSizeCategory = true
                
                // setup stack view
                let fontLabel = UIFont.systemFont(ofSize: 21)
                
                self.image1.image = UIImage(named: "Onboarding 1st Icon")
                self.label1.text = "Add your waste with the camera feature"
                self.label1.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: fontLabel)
                self.label1.adjustsFontForContentSizeCategory = true
                
                self.image2.image = UIImage(named: "Onboarding 2nd Icon")
                self.label2.text = "Get data and track your waste production"
                self.label2.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: fontLabel)
                self.label2.adjustsFontForContentSizeCategory = true
                
                self.image3.image = UIImage(named: "Onboarding 3rd Icon")
                self.label3.text = "Get tips on how to reduce and recycle it"
                self.label3.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: fontLabel)
                self.label2.adjustsFontForContentSizeCategory = true
                
                
                // setup button
                let fontButton = UIFont.systemFont(ofSize: 24)
                
                self.getStarted.setTitle("Get Started", for: .normal)
                self.getStarted.backgroundColor = UIColor(red: 59/255, green: 126/255, blue: 115/255, alpha: 1)
                self.getStarted.setTitleColor(.white, for: .normal)
                self.getStarted.titleLabel?.font = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: fontButton)
                self.getStarted.layer.cornerRadius = 10
                
                self.getStarted.adjustsImageSizeForAccessibilityContentSizeCategory = true
            }


        }

