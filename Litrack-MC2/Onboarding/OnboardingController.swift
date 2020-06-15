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
    
    let speeceService = SpeechService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let welcome = "welcome to Litrack. The application that helps you control your waste usage. You can add your waste by using camera feature and then get data of how much waste you've been using daily. You can also get some tips on how to reduce and recycle it. To get started please push the green button on the bottom".localized
        speeceService.say(welcome)
        
        // setup welcome
        self.welcome.text = "Welcome!"
        self.welcome.font = UIFont.boldSystemFont(ofSize: 60)
        self.welcome.textAlignment = .center
        
        // setup stack view
        self.image1.image = UIImage(named: "Onboarding 1st Icon")
        self.label1.font = UIFont.systemFont(ofSize: 21)
        self.label1.text = "Add your waste with the camera feature"
        
        self.image2.image = UIImage(named: "Onboarding 2nd Icon")
        self.label2.font = UIFont.systemFont(ofSize: 21)
        self.label2.text = "Get data and track your waste production"
        
        self.image3.image = UIImage(named: "Onboarding 3rd Icon")
        self.label3.font = UIFont.systemFont(ofSize: 21)
        self.label3.text = "Get tips on how to reduce and recycle it"
        
        
        // setup button
        self.getStarted.setTitle("Get Started", for: .normal)
        self.getStarted.backgroundColor = UIColor(red: 59/255, green: 126/255, blue: 115/255, alpha: 1)
        self.getStarted.setTitleColor(.white, for: .normal)
        self.getStarted.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        self.getStarted.layer.cornerRadius = 10
    }


}

