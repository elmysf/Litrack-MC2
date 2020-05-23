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
        
        setupNavigationBar()

        illustrationImage.image = detail.illustration
        descriptionText.text = detail.desc
    }
    
    private func setupNavigationBar(){
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 59/255, green: 126/255, blue: 115/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isTranslucent =  false
        self.navigationController?.navigationBar.tintColor = .white

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
}
