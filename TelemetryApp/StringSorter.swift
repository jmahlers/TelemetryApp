//
//  StringSorter.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/4/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

extension String{
    func lessThan(_ rhs: String)->Bool{
        let lhs = self
        if(Telemetry.shared.keyPriority[lhs] != nil){
            if(Telemetry.shared.keyPriority[rhs] != nil){
                return Telemetry.shared.keyPriority[lhs]! < Telemetry.shared.keyPriority[rhs]!
            }else{
                return true
            }
        }else{
            if(Telemetry.shared.keyPriority[rhs] != nil){
                return false
            }else{
                return lhs<rhs
            }
        }
    }
}
extension Telemetry{
    ///Assigns and updates the priority dictionary. Index's start at 0.
    func assignPriority(sensorKey: String, index: Int){
        if(Telemetry.shared.keyPriority[sensorKey] != nil){
            let formerPriority = Telemetry.shared.keyPriority[sensorKey]!
            //Moving an element to higher priority
            if(index>formerPriority){
                for key in Telemetry.shared.keyPriority.keys {
                    if(Telemetry.shared.keyPriority[key]! >= index){
                        if(Telemetry.shared.keyPriority[key]! < formerPriority){
                            Telemetry.shared.keyPriority[key]! += 1
                        }
                    }
                }
            }else{
                //Moving an element to lower priority
                for key in Telemetry.shared.keyPriority.keys {
                    if(Telemetry.shared.keyPriority[key]! > formerPriority){
                        if(Telemetry.shared.keyPriority[key]! <= index){
                            Telemetry.shared.keyPriority[key]! -= 1
                        }
                    }
                }
            }
        }else{
            for key in Telemetry.shared.keyPriority.keys {
                if(Telemetry.shared.keyPriority[key]! >= index){
                    Telemetry.shared.keyPriority[key]! += 1
                }
            }
        }
        Telemetry.shared.keyPriority[sensorKey] = index
    }
    func getPriority(sensorKey: String) -> Int{
        if(Telemetry.shared.keyPriority[sensorKey] != nil){
            return Telemetry.shared.keyPriority[sensorKey]!
        }else{
            return -1
        }
    }
}
