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
    
    let speechService = SpeechService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
    
        illustrationImage.image = detail.illustration
        descriptionText.text = detail.desc
        
        textViewDidChange(descriptionText)
        let textDecs = UIFont.systemFont(ofSize: 16)
        descriptionText.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: textDecs)
        descriptionText.adjustsFontForContentSizeCategory = true
    }
    
    // add voice over
    override func viewDidAppear(_ animated: Bool) {
        let manageInfoVoiceOver = String(detail.desc ?? descriptionText.text)
        speechService.speaking(manageInfoVoiceOver)
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
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        dismiss(animated: true, completion: nil)
    }
}
