//
//  ManageViewController.swift
//  Litrack-MC2
//
//  Created by Karina Widyastuti on 22/05/20.
//  Copyright © 2020 Karina Widyastuti. All rights reserved.
//

import UIKit

class ManageInfoViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var illustrationImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    
    var detail: (illustration: UIImage?, desc: String?)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         overrideUserInterfaceStyle = .light
    
        illustrationImage.image = detail.illustration
        descriptionText.text = detail.desc
        
        textViewDidChange(descriptionText)
        descriptionText.font = UIFont.systemFont(ofSize: 16)
    }
    
    // setup line spacing in textview
    func textViewDidChange(_ textView: UITextView) {
        let mutableAttrStr = NSMutableAttributedString(string: textView.text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 14
        mutableAttrStr.addAttributes([NSAttributedString.Key.paragraphStyle:style], range: NSMakeRange(0, mutableAttrStr.length))
        textView.attributedText = mutableAttrStr
    }

    @objc func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
