//
//  DatasetSetUpUtils.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/8/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import Charts

extension TelemetryViewController {
    
    func setUpRawDataSet(chart: SmallTelemetryChartView, entries: [ChartDataEntry]) -> LineChartDataSet {
        let set = LineChartDataSet(entries: entries, label: chart.keyToGraph)
        set.drawIconsEnabled = false
        set.lineDashLengths = [5, 0]
        set.highlightLineDashLengths = [5, 2.5]
        set.setColor(.black)
        set.setCircleColor(.black)
        set.lineWidth = 0
        set.circleRadius = 1.2
        set.drawValuesEnabled = false
        set.drawCircleHoleEnabled = false
        set.valueFont = .systemFont(ofSize: 9)
        set.formLineDashLengths = [5, 2.5]
        set.formLineWidth = 1
        set.formSize = 15
        set.mode = .cubicBezier
        return set
    }
    
    func setUpRollingAvgDataSet(entries: [ChartDataEntry]) -> LineChartDataSet {
        let set = LineChartDataSet(entries: entries, label: "Rolling Average")
        set.drawIconsEnabled = false
        //        set.mode = .cubicBezier
        set.lineDashLengths = [5, 0]
        set.highlightLineDashLengths = [5, 2.5]
        set.setColor(.blue)
        //set1.setCircleColor(.black)
        set.lineWidth = 2
        set.circleRadius = 0
        set.drawValuesEnabled = false
        set.drawCircleHoleEnabled = false
        set.valueFont = .systemFont(ofSize: 9)
        set.formLineDashLengths = [5, 2.5]
        set.formLineWidth = 1
        set.formSize = 15
        
        let gradientColors2 = [ChartColorTemplates.colorFromString("#00add8e6").cgColor,
                               ChartColorTemplates.colorFromString("#ffadd8e6").cgColor]
        let gradient2 = CGGradient(colorsSpace: nil, colors: gradientColors2 as CFArray, locations: nil)!
        
        set.fillAlpha = 1
        set.fill = Fill(linearGradient: gradient2, angle: 90) //.linearGradient(gradient, angle: 90)
        set.drawFilledEnabled = true
        return set
    }
    
    
}
