//
//  ViewController.swift
//  Litrack
//
//  Created by Sufiandy Elmy on 28/05/20.
//  Copyright © 2020 Sufiandy Elmy. All rights reserved.
//

import UIKit
<<<<<<< HEAD:Litrack-MC2/Litrack-MC2/ViewController.swift
import CoreML
import CoreData
=======
import SwiftyGif
>>>>>>> a870e3c2367cd5f08c98a2df08f5749942feef4e:Litrack-MC2/ViewController.swift

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

