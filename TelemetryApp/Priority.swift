//
//  KeySorter.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/4/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

//All of this code relates to sorting the keys and other fields of Telemetry.shared

extension Telemetry{
    //This code is just a bunch of logic to decide which elements to increase and decrease as keys are set.
    ///Sets the given sensorKey to have priority index and adjusts other priorities to maintain that a given index is guranteed to have only one sensorKey.
    func setPriority(sensorKey: String, index: Int){
        if(self.keyPriority[sensorKey] != nil){
            let formerPriority = self.keyPriority[sensorKey]!
            //Moving an element to higher priority
            if(index>formerPriority){
                for key in self.keyPriority.keys {
                    if(self.keyPriority[key]! >= index){
                        if(self.keyPriority[key]! < formerPriority){
                            self.keyPriority[key]! += 1
                        }
                    }
                }
            }else{
                //Moving an element to lower priority
                for key in self.keyPriority.keys {
                    if(self.keyPriority[key]! > formerPriority){
                        if(self.keyPriority[key]! <= index){
                            self.keyPriority[key]! -= 1
                        }
                    }
                }
            }
        }else{
            for key in self.keyPriority.keys {
                if(self.keyPriority[key]! >= index){
                    self.keyPriority[key]! += 1
                }
            }
        }
        self.keyPriority[sensorKey] = index
        self.sortedSensors.sort()
    }
    ///Gets the priority of sensorKey. Returns -1 if the dictionary entry is nil.
    func getPriority(sensorKey: String) -> Int{
        if(self.keyPriority[sensorKey] != nil){
            return self.keyPriority[sensorKey]!
        }else{
            return -1
        }
    }
    func removePriority(sensorKey: String){
        guard let formerKey = self.keyPriority[sensorKey] else{
            return
        }
        for key in self.keyPriority.keys{
            if(self.keyPriority[key]! > formerKey){
                self.keyPriority[key]! -= 1
            }
        }
        self.keyPriority.removeValue(forKey: sensorKey)
        self.sortedSensors.sort()
    }
}
