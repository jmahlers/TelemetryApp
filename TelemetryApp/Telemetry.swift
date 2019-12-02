//
//  Telemetry.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import IKEventSource

//Any use of Telemetry must use the format Telemetry.shared._
//It is a singleton to ensure there is only ever one Telemetry object
//As a singleton, Telemetry.shared has global scope
//This class is extended within KeySorter.swift which deals with the sorting of keys by priority and alphabetical order

///Class of type EventSource that contains a singleton instance of itself
class Telemetry: EventSource {
    ///Delegate to process protocol methods
    weak var delegate:TelemetryDelegate?
    weak var favoritesDelegate:FavoritesDelegate?
    weak var pinnedDelegate:PinnedDelegate?
    ///Dictionary of received messages
    var dataSource:[Sensor: [DataPoint]] = [:]
    ///Buffer for messages that haven't been plotted yet
    var dataToPlot:[Sensor: [DataPoint]] = [:]
    ///Sorted array of favorited sensors
    fileprivate var favoriteSensors:[Sensor] = []
    ///Sorted array of non-favorited sensors
    fileprivate var generalSensors:[Sensor] = []
    ///Timer that tracks the time since the app launched.
    var timer: Date?
    var favoriteCharts: [SmallLiveSciChart] = []
    var generalCharts: [SmallLiveSciChart] = []
    var numConnection = 0
    let userSave = UserDefaults.standard
    var pinnedSensors:[Sensor] = []
    ///Singleton of Telemetry that connects to the telemetry server
    static let shared = Telemetry()
    
    private init(){
        //Reading plist for chart favorites
        if let favoritesData = userSave.value(forKey:"favoritesSensors") as? Data {
            if let savedFavorites = try? PropertyListDecoder().decode(Array<Sensor>.self, from: favoritesData) {
                favoriteSensors.append(contentsOf: savedFavorites)
            }
        }
        //Reading plist for sensors pinned to dock
        if let pinnedData = userSave.value(forKey:"pinnedSensors") as? Data {
            if let savedPinnedSensors = try? PropertyListDecoder().decode(Array<Sensor>.self, from: pinnedData) {
                pinnedSensors.append(contentsOf: savedPinnedSensors)
            }
        }
        //Initializing instance variables
        let urlString =  "https://jksites.dev/api/telemetry"
        let url = URL(string: urlString)
        timer = Date()
        //Initialize EventSource
        super.init(url: url!)
        
        self.onOpen{
            print("Connection to " + urlString + " open")
            self.delegate?.manageOpen()
            self.numConnection += 1
            print(String(self.numConnection)+" connection")
        }
        
        self.onMessage{ (id, event, data) in
            let jsonData = data!.data(using: .utf8)
            do {
                let sensorReading = try JSONDecoder().decode(SensorReading.self, from: jsonData!)
                let sensor = Sensor(sensorReading)
                let timeElapsed = self.timer?.timeIntervalSinceNow
                let dataPoint = DataPoint(time: (timeElapsed ?? 1) * -1, sensorReading: sensorReading)
                if(self.dataSource[sensor] != nil){
                    self.dataSource[sensor]!.append(dataPoint)
                }else{
                    if(self.favoriteSensors.contains(sensor)){
                        self.delegate?.newSensor(sensor: sensor)
                    }else{
                        self.generalSensors.append(sensor)
                        self.generalSensors.sort()
                        self.delegate?.newSensor(sensor: sensor)
                    }
                    self.dataSource[sensor] = [dataPoint]
                }
                
                if (self.dataToPlot[sensor] != nil) {
                    self.dataToPlot[sensor]!.append(dataPoint)
                } else {
                    self.dataToPlot[sensor] = [dataPoint]
                }
                
                self.delegate?.manageMessage(key: sensorReading.key, dataPoint: dataPoint)
            } catch {
                print("Message decoded to an error")
            }
        }
        
        self.onComplete{ (status, shouldReconnect, netLayer) in
            self.delegate?.manageComplete()
        }
        
    }
    func getFavoriteSensors()->[Sensor]{
        return favoriteSensors
    }
    func getGeneralSensors()->[Sensor]{
        return generalSensors
    }
}

// Has to be in this file because of fileprivate
extension Sensor{
    func addFavorite(){
        if(!Telemetry.shared.favoriteSensors.contains(self)){
            Telemetry.shared.favoriteSensors.append(self)
            if let chartFrom = Telemetry.shared.generalCharts.first(where: {(chart) in
                return chart.key == self.key
            }){
                Telemetry.shared.generalCharts.removeAll(where: {(chart) in
                    return chart.key == self.key
                })
                Telemetry.shared.favoriteCharts.append(chartFrom)
            }
            Telemetry.shared.generalSensors.removeAll(where: {(sensor) in
                return sensor == self
            })
            Telemetry.shared.generalCharts.removeAll(where: {(chart) in
                return chart.key == self.key
            })
            Telemetry.shared.favoriteCharts.sort()
            Telemetry.shared.favoriteSensors.sort()
            saveFavorites()
        }
    }
    func removeFavorite(){
        if(Telemetry.shared.favoriteSensors.contains(self)){
            Telemetry.shared.generalSensors.append(self)
            Telemetry.shared.favoriteSensors.removeAll(where: {(sensor) in
                return sensor == self
            })
            if let chartFrom = Telemetry.shared.favoriteCharts.first(where: {(chart) in
                return chart.key == self.key
            }){
                Telemetry.shared.favoriteCharts.removeAll(where: {(chart) in
                    return chart.key == self.key
                })
                Telemetry.shared.generalCharts.append(chartFrom)
            }
            Telemetry.shared.favoriteCharts.sort()
            Telemetry.shared.generalCharts.sort()
            Telemetry.shared.favoriteSensors.sort()
            Telemetry.shared.generalSensors.sort()
            saveFavorites()
        }
    }
    func saveFavorites(){
        let userSave = UserDefaults.standard
        userSave.set(try? PropertyListEncoder().encode(Telemetry.shared.favoriteSensors), forKey:"favoritesSensors")
        Telemetry.shared.favoritesDelegate?.favoritesChanged()
    }
    func pin()->Bool{
        if(Telemetry.shared.pinnedSensors.count >= 4){
            return false
        }else{
            if(!Telemetry.shared.pinnedSensors.contains(self)){
                Telemetry.shared.pinnedSensors.append(self)
                Telemetry.shared.pinnedSensors.sort()
            }
            savePins()
            return true
        }
       
    }
    func unpin(){
        Telemetry.shared.pinnedSensors.removeAll(where: {(sensor) in
            return sensor == self
        })
        savePins()
    }
    func savePins(){
        let userSave = UserDefaults.standard
        userSave.set(try? PropertyListEncoder().encode(Telemetry.shared.pinnedSensors), forKey:"pinnedSensors")
        Telemetry.shared.pinnedDelegate?.pinnedChanged()
    }
}
