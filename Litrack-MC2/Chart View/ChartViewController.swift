//
//  ChartViewController.swift
//  Litrack-MC2
//
//  Created by Karina Widyastuti on 22/05/20.
//  Copyright © 2020 Karina Widyastuti. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController {
   
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var manageWasteTitle: UILabel!
    @IBOutlet weak var reduceSV: UIStackView!
    @IBOutlet weak var reuseSV: UIStackView!
    @IBOutlet weak var recycleSV: UIStackView!
    @IBOutlet weak var pieChartView: PieChartView!
    
    // var plasticWaste = PieChartDataEntry(value: 0)
    var plasticWaste = PieChartDataEntry(value: 10)
    
    // var canWaste = PieChartDataEntry(value: 0)
    var canWaste = PieChartDataEntry(value: 5)
    
    // var glassWaste = PieChartDataEntry(value: 0)
    var glassWaste = PieChartDataEntry(value: 3)

    var wasteUsages = [PieChartDataEntry]()
    
    // Manage Waste Information in ManageViewController
    var manageInformation = [
        (UIImage(named: "illustrationReduce"), "\nReducing is simply creating less waste and also the best method for keeping our earth clean because it stops the problem at the source.\n\nTo reduce your waste, determine your true needs and avoid impulse buys.\n\nHere’s what you can do to start reducing your waste:\n\nFor plastic:\n•    Replace plastic bottle with tumbler.\n•    Don’t use plastic straws or utensils, bring reusable ones instead.\n•    Use a personal shopping bag instead of plastic bags.\n•    Change your food storage. Instead of using plastic, use compartment storage in your kitchen.\n\nFor cans:\n•     Replace canned fruits and vegetables by finding it in the freezer section of your grocery store.\n•     Start and cook from scratch. By buying the ingredient instead of buying the canned foods and cooking them at home, it not only saves money but they taste so much better than canned foods\n•     Start growing or visit your local farm to get your freshly harvested ingredients\n\nFor glass, try to cook from scratch. For example, instead of buying syrup in a glass bottle, we can try to make our own natural homemade syrup that are healthier and taste  just as delicious. If it’s hard for you, try to reuse or recycle more."),
        (UIImage(named: "illustrationReuse"), "\nReusing is taking old items that you might consider throwing away and finding a new use for them, thereby reducing the consumption of new resources. Reusing helps in situations where it isn't possible to reduce.\n\nHere ways to practice reuse in your daily life:\n\nFor plastic, you can reuse small plastic bottles as a snack storage, salt-sugar or spices storage. You can also reuse big bottles as a watering can, piggy bank, trash can, DIY Sprinkleror even a snack bowl.\n\nFor cans, try reusing soda cans as a lantern, candle holder, planter, cutlery or utensils storage. You can also use tin cans as a drawer organizer, or paint can cubbies.\n\nYou can reuse glass bottles and jars as a vase or as storage for food, spices (sugar, salt, etc.), and tools."),
        (UIImage(named: "illustrationRecycle"), "\nRecycling is changing old products into new ones so they can be resold. Items that might otherwise be considered trash turned into a useful new product.\n\nSome tips for recycling:\n•     Buy products that can be recycled such as glass jars. Avoid buying hazardous materials that could pose difficulty for you to recycle.\n•     Buy products that have been made from recycled material. These products are no different from standard goods; they’re just helping to make the most of valuable resources.\n\nHere are some ideas you can do to recycle your wastes:\n\nFor plastic bottles you can turn it into supply cups, planter, piggy bank, pencil/marker organiser, or even a vertical garden.\n\nYou can turn soda or tin cans into a decorative flower vase, utensils and cutlery holders.\n\nYou can also recycle glass bottles and jars into home decorations or homemade hanging storage for your kitchen."),
        (UIImage(named: "illustrationRecycle"), "ipsum")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // View
        setupNavigationBar()
        setBackgroundImage()
        title()
        setStackView()
        
        // StackView addTapped
        addTapped(parameter: &reduceSV)
        addTapped(parameter: &reuseSV)
        addTapped(parameter: &recycleSV)
        
        // Chart View
        pieChartView.chartDescription?.text = ""
        pieChartView.holeColor = .none
        
        // plasticWaste.value = value....
        plasticWaste.label = "Plastic"
        
        // canWaste.value = value....
        canWaste.label = "Can"
        
        // glassWaste.value = value....
        glassWaste.label = "Glass"
        
        wasteUsages = [plasticWaste, canWaste, glassWaste]
        
        UpdateChartData()
    }
    
    // MARK: Create Chart
    func UpdateChartData(){
        let chartDataSet = PieChartDataSet(entries: wasteUsages, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        chartData.setValueFormatter(formatter)
        
        
        let colors = [UIColor(red:  208/255, green: 103/255, blue: 103/255, alpha: 1), UIColor(red: 59/255, green: 109/255, blue: 179/255, alpha: 1), UIColor(red: 234/255, green: 190/255, blue: 65/255, alpha: 1)]
        chartDataSet.colors = colors
        
        pieChartView.data = chartData
    }
    
    // setup navigation bar
    private func setupNavigationBar(){
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 59/255, green: 126/255, blue: 115/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isTranslucent =  false
        self.navigationController?.navigationBar.tintColor = .white
        
        self.title = "Manage Waste"
    }
            
    @IBAction func backToCamera(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // setup background
    private func setBackgroundImage(){
        self.backgroundImage.image = UIImage(named: "ChartBg")
    }
        
    // setup manage Waste Title
    private func title(){
        self.manageWasteTitle.text = "Manage Your Waste"
        self.manageWasteTitle.font = UIFont.systemFont(ofSize: 24)
        self.manageWasteTitle.textAlignment = .center
        self.manageWasteTitle.textColor = UIColor(red: 59/255, green: 126/255, blue: 115/255, alpha: 1)
    }
    
    // setup stack view
    private func setStackView(){
        // set Reduce Stack View
        reduceSV.axis = .vertical
        reduceSV.alignment = .fill
        reduceSV.distribution = .fillEqually
        reduceSV.spacing = 0
        
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
        parameter.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.objectTapped)))
    }

    @objc func objectTapped(gesture: UIGestureRecognizer){
        let controller = UIStoryboard(name: "Chart.Screen", bundle: nil).instantiateViewController(withIdentifier: "ManageViewController") as! ManageInfoViewController
        let navigationControl = UINavigationController(rootViewController: controller)
        navigationControl.modalPresentationStyle = .automatic
        navigationControl.modalTransitionStyle = .coverVertical
        navigationControl.navigationBar.backgroundColor = UIColor(red: 72/255, green: 154/255, blue: 141/255, alpha: 1)
        navigationControl.navigationBar.prefersLargeTitles = true
        navigationControl.navigationBar.isTranslucent = false
        navigationControl.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationControl.navigationBar.barStyle = .black
        navigationControl.navigationBar.tintColor = .white
        navigationControl.navigationBar.barTintColor = .white
        
        navigationControl.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Manage Waste", style: .plain, target: nil, action: #selector(back))
        
        
        switch gesture.view as? UIStackView {
        case (reduceSV):
            controller.title = "Reduce Waste"
            controller.detail = manageInformation[0]
        case (reuseSV):
            controller.title = "Reuse Waste"
            controller.detail = manageInformation[1]
        case (recycleSV):
            controller.title = "Recycle Waste"
            controller.detail = manageInformation[2]
        default:
            controller.detail = manageInformation[3]
        }
    
        self.present(navigationControl, animated: true, completion: nil)
    }
    
   @objc func back(){
        dismiss(animated: true, completion: nil)
    }

}
