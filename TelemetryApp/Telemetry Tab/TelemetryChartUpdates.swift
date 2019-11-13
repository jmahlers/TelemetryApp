//
//  TelemetryChartUpdating.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/9/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
import SciChart

extension TelemetryViewController{
    
    func updateAllChartsWithManyNewMessages() {
        for chart in Telemetry.shared.favoriteCharts {
            chart.updateWithManyNewMessages()
        }
        for chart in Telemetry.shared.generalCharts {
            chart.updateWithManyNewMessages()
        }
    }
    
    func clearAllChartData() {
        for chart in Telemetry.shared.favoriteCharts {
            chart.clearData()
        }
        for chart in Telemetry.shared.generalCharts {
            chart.clearData()
        }
    }
    
    func updateVisibleRangeOfEveryGraph(time: Double) {
        for chart in Telemetry.shared.favoriteCharts {
            chart.updateVisibleRange(time: time)
        }
        for chart in Telemetry.shared.generalCharts {
            chart.updateVisibleRange(time: time)
        }
    }
    
}
