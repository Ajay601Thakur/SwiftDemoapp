//
//  ViewController.swift
//  SwiftDemoAppp
//
//  Created by Ajay601Thakur on 07/13/2022.
//  Copyright (c) 2022 Ajay601Thakur. All rights reserved.
//

import UIKit
import Charts
import SwiftDemoAppp

class ViewController: UIViewController {

    @IBOutlet weak var subView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateChartData()
        let title = ChatManager().getSomeStringData()
        
        print("title>>>>>\(title)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateChartData()  {
        let chart = PieChartView(frame: subView.frame)
        // 2. generate chart data entries
        let track = ["Income", "Expense", "Wallet", "Bank"]
        let money = [650, 456.13, 78.67, 856.52]

        var entries = [PieChartDataEntry]()
        for (index, value) in money.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = value
            entry.label = track[index]
            entries.append( entry)
        }

        // 3. chart setup
        let set = PieChartDataSet( entries: entries, label: "Line Chart")
        // this is custom extension method. Download the code for more details.
        var colors: [UIColor] = []

        for _ in 0..<money.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        set.colors = colors
        let data = PieChartData(dataSet: set)
        chart.data = data
        chart.noDataText = "No data available"
        // user interaction
        chart.isUserInteractionEnabled = true

        let d = Description()
        chart.chartDescription = d
        chart.holeRadiusPercent = 0.5
        chart.transparentCircleColor = UIColor.clear
        subView.addSubview(chart)
    }

}

