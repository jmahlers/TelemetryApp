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
        self.sortTelemetry()
    }
    ///Gets the priority of sensorKey. Returns -1 if the dictionary entry is nil.
    func getPriority(sensorKey: String) -> Int{
        if(self.keyPriority[sensorKey] != nil){
            return self.keyPriority[sensorKey]!
        }else{
            return -1
        }
    }
    func deletePriority(sensorKey: String){
        guard let formerKey = self.keyPriority[sensorKey] else{
            return
        }
        for key in self.keyPriority.keys{
            if(self.keyPriority[key]! > formerKey){
                self.keyPriority[key]! -= 1
            }
        }
        self.keyPriority.removeValue(forKey: sensorKey)
    }
    ///Sorts all field arrays according to the priority and then alphabetical order of sortedKeys
    func sortTelemetry(){
        let offsets = self.sortedKeys.enumerated().sorted(by: {$0.element.lessThan($1.element) }).map {$0.offset}
        self.sortedKeys = offsets.map {self.sortedKeys[$0]}
        self.sortedUnits = offsets.map {self.sortedUnits[$0]}
        self.sortedSystems = offsets.map {self.sortedSystems[$0]}
        self.sortedDescription = offsets.map {self.sortedDescription[$0]}
    }
}
