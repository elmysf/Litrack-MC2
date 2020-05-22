//
//  ChartViewController.swift
//  Litrack-MC2
//
//  Created by Karina Widyastuti on 22/05/20.
//  Copyright © 2020 Karina Widyastuti. All rights reserved.
//

import UIKit
import CoreData
import Charts

class ChartViewController: UIViewController {

   
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var manageWasteTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setBackgroundImage()
        title()
    }
    
    // set navigation bar
    private func setupNavigationBar(){
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 59/255, green: 126/255, blue: 115/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isTranslucent =  false
        self.navigationController?.navigationBar.tintColor = .white

        self.navigationItem.backBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: nil, action: nil)
        
        self.title = "Manage Waste"
    }
        
    // set background image
    private func setBackgroundImage(){
        self.backgroundImage.image = UIImage(named: "ChartBg")
    }
        
    // set manage Waste Title
    private func title(){
        self.manageWasteTitle.text = "Manage Your Waste"
        self.manageWasteTitle.font = UIFont.systemFont(ofSize: 24)
        self.manageWasteTitle.textAlignment = .center
        self.manageWasteTitle.textColor = UIColor(red: 59/255, green: 126/255, blue: 115/255, alpha: 1)
    }
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

