//
//  Priority.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/4/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

extension Telemetry{
    //This code is just a bunch of logic to decide which elements to increase and decrease as keys are set.
    ///Sets the given sensorKey to have priority index and adjusts other priorities to maintain that a given index is guranteed to have only one sensorKey.
    func setPriority(sensor: Sensor, index: Int){
        if(self.sensorPriority[sensor] != nil){
            let formerPriority = self.sensorPriority[sensor]!
            //Moving an element to higher priority
            if(index>formerPriority){
                for key in self.sensorPriority.keys {
                    if(self.sensorPriority[key]! >= index){
                        if(self.sensorPriority[key]! < formerPriority){
                            self.sensorPriority[key]! += 1
                        }
                    }
                }
            }else{
                //Moving an element to lower priority
                for key in self.sensorPriority.keys {
                    if(self.sensorPriority[key]! > formerPriority){
                        if(self.sensorPriority[key]! <= index){
                            self.sensorPriority[key]! -= 1
                        }
                    }
                }
            }
        }else{
            for key in self.sensorPriority.keys {
                if(self.sensorPriority[key]! >= index){
                    self.sensorPriority[key]! += 1
                }
            }
        }
        self.sensorPriority[sensor] = index
        self.sortedSensors.sort()
    }
    
    ///Gets the priority of sensorKey. Returns -1 if the dictionary entry is nil.
    func getPriority(sensor: Sensor) -> Int{
        if(self.sensorPriority[sensor] != nil){
            return self.sensorPriority[sensor]!
        }else{
            return -1
        }
    }
    
    ///Removes a sensor from the priority dictionary
    func removePriority(sensor: Sensor){
        
        guard let formerKey = self.sensorPriority[sensor] else{
            return
        }
        for key in self.sensorPriority.keys{
            if(self.sensorPriority[key]! > formerKey){
                self.sensorPriority[key]! -= 1
            }
        }
        self.sensorPriority.removeValue(forKey: sensor)
        self.sortedSensors.sort()
    }
}
