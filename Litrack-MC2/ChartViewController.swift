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
    @IBOutlet weak var reduceSV: UIStackView!
    @IBOutlet weak var reuseSV: UIStackView!
    @IBOutlet weak var recycleSV: UIStackView!
    @IBOutlet weak var pieChartView: PieChartView!
    
    var manageInformation = [
        (UIImage(named: "illustrationRecycle"), "Ipsum"),
        (UIImage(named: "illustrationRecycle"), "ipsum"),
        (UIImage(named: "illustrationRecycle"), "ipsum"),
        (UIImage(named: "illustrationRecycle"), "ipsum")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setBackgroundImage()
        title()
        setStackView()
        
        addTapped(parameter: &reduceSV)
        addTapped(parameter: &reuseSV)
        addTapped(parameter: &recycleSV)
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
    
    // set pieChartView
    
        
    // set manage Waste Title
    private func title(){
        self.manageWasteTitle.text = "Manage Your Waste"
        self.manageWasteTitle.font = UIFont.systemFont(ofSize: 24)
        self.manageWasteTitle.textAlignment = .center
        self.manageWasteTitle.textColor = UIColor(red: 59/255, green: 126/255, blue: 115/255, alpha: 1)
    }
    
    // set stack view
    private func setStackView(){
        // set Reduce Stack View
        reduceSV.axis = .vertical
        reduceSV.alignment = .fill
        reduceSV.distribution = .fillEqually
        reduceSV.spacing = 0
        reduceSV.isUserInteractionEnabled = true
        
        let image1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        image1.image = UIImage(named: "REDUCE")
        image1.contentMode = .scaleAspectFit
        reduceSV.addArrangedSubview(image1)
        
        let label1 = UILabel()
        label1.text = "Reduce"
        label1.textAlignment = .center
        label1.textColor = .black
        label1.font = UIFont.systemFont(ofSize: 21)
        reduceSV.addArrangedSubview(label1)
        
        // set Reuse Stack view
        reuseSV.axis = .vertical
        reuseSV.alignment = .fill
        reuseSV.distribution = .fillEqually
        reuseSV.spacing = 0
        reuseSV.isUserInteractionEnabled = true
        
        let image2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        image2.image = UIImage(named: "REUSE")
        image2.contentMode = .scaleAspectFit
        reuseSV.addArrangedSubview(image2)
        
        let label2 = UILabel()
        label2.text = "Reuse"
        label2.textAlignment = .center
        label2.textColor = .black
        label2.font = UIFont.systemFont(ofSize: 21)
        reuseSV.addArrangedSubview(label2)
        
        // set Recycle Stack View
        recycleSV.axis = .vertical
        recycleSV.alignment = .fill
        recycleSV.distribution = .fillEqually
        recycleSV.spacing = 0
        recycleSV.isUserInteractionEnabled = true
        
        let image3 = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        image3.image = UIImage(named: "RECYCLE")
        image3.contentMode = .scaleAspectFit
        recycleSV.addArrangedSubview(image3)
        
        let label3 = UILabel()
        label3.text = "Recycle"
        label3.textAlignment = .center
        label3.textColor = .black
        label3.font = UIFont.systemFont(ofSize: 21)
        recycleSV.addArrangedSubview(label3)
        
    }
    
     // add Tap Gesture Stack View
    func addTapped( parameter: inout UIStackView){
        parameter.isUserInteractionEnabled = true
        parameter.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(self.objectTapped)))
    }

    @objc func objectTapped(gesture: UIGestureRecognizer){
        let controller = UIStoryboard(name: "Chart.Screen", bundle: nil).instantiateViewController(withIdentifier: "manageViewController") as! ManageViewController

        switch gesture.view as? UIStackView {
        case (reuseSV):
            controller.detail = manageInformation[0]
        case (recycleSV):
            controller.detail = manageInformation[1]
        case (reduceSV):
            controller.detail = manageInformation[2]
        default:
            controller.detail = manageInformation[3]
        }

        self.navigationController?.pushViewController(controller, animated: true)
    
    }
}
