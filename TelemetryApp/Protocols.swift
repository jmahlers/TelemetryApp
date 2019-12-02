//
//  Protocols.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation

///Protocol to proccess messages, and connection actions
protocol TelemetryDelegate: AnyObject {
    /// Triggers upon incoming event
    func manageMessage(key: String, dataPoint: DataPoint)
    /// Triggers upon opening server connection
    func manageOpen()
    ///Triggers upon closing server connection
    func manageComplete()
    ///Triggers when a sensor is added
    func newSensor(sensor: Sensor)
}
protocol  FavoritesDelegate: AnyObject {
    func favoritesChanged()
}
protocol PinnedDelegate: AnyObject {
    func pinnedChanged()
}
