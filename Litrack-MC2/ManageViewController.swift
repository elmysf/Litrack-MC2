//
//  ManageViewController.swift
//  Litrack-MC2
//
//  Created by Karina Widyastuti on 22/05/20.
//  Copyright © 2020 Karina Widyastuti. All rights reserved.
//

import UIKit

class ManageViewController: UIViewController {
    
    @IBOutlet weak var illustrationImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    
    var detail: (illustration: UIImage?, desc: String?)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        illustrationImage.image = detail.illustration
        descriptionText.text = detail.desc
    }
    

}
