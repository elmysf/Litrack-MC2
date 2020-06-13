//
//  OnboardingController.swift
//  Litrack-MC2
//
//  Created by Karina Widyastuti on 12/06/20.
//  Copyright © 2020 Karina Widyastuti. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var onboarding1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getStartedButton.layer.cornerRadius = 10
        
        
    }
    
}
