//
//  Protocols.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation

///Protocol to proccess messages, and connection actions
protocol TelemetryDelegate: AnyObject{
    
    func manageMessage(key: String, dataPoint: DataPoint)  // Triggers upon incoming event
    
    func manageOpen()   // Triggers upon opening server connection
    
    func manageComplete()   //T riggers upon closing server connection
    
}
