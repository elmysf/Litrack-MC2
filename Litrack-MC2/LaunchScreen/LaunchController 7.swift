//
//  LaunchController.swift
//  Litrack-MC2
//
//  Created by Sufiandy Elmy on 30/05/20.
//  Copyright © 2020 Karina Widyastuti. All rights reserved.
//

import UIKit
import SwiftyGif

class ViewController: UIViewController {

    let logoAnimationView = LogoAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoAnimationView)
        logoAnimationView.pinEdgesToSuperView()
        logoAnimationView.logoGifImageView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoAnimationView.logoGifImageView.startAnimatingGif()
    }

}
extension ViewController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        logoAnimationView.isHidden = true
    }
 }
