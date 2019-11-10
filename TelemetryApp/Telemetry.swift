//
//  Telemetry.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import IKEventSource
import Charts

//Any use of Telemetry must use the format Telemetry.shared._
//It is a singleton to ensure there is only ever one Telemetry object
//As a singleton, Telemetry.shared has global scope
//This class is extended within KeySorter.swift which deals with the sorting of keys by priority and alphabetical order

///Class of type EventSource that contains a singleton instance of itself
class Telemetry: EventSource {
    ///Delegate to process protocol methods
    weak var delegate:TelemetryDelegate?
    ///Dictionary of received messages
    var dataSource:[Sensor: [DataPoint]] = [:]
    ///Sorted array of favorited sensors
    fileprivate var favoriteSensors:[Sensor] = []
    ///Sorted array of non-favorited sensors
    fileprivate var generalSensors:[Sensor] = []
    ///Timer that tracks the time since the app launched.
    var timer: Date?
    //Dictionary to assign higher sorting priority to specific sensors.
    //internal var sensorPriority:[Sensor:Int] = [:]     //Deprocated with addition of favoriteSensors.
    var favoriteCharts: [SmallTelemetryChartView] = []
    var generalCharts: [SmallTelemetryChartView] = []
    
    ///Singleton of Telemetry that connects to the telemetry server
    static let shared = Telemetry()
    
    private init(){
        //Initializing instance variables
        let urlString =  "https://jksites.dev/api/telemetry"
        let url = URL(string: urlString)
        timer = Date()
        //Initialize EventSource
        super.init(url: url!)
        
        self.onOpen{
            print("Connection to " + urlString + " open")
            self.delegate?.manageOpen()
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
                        self.dataSource[sensor] = [dataPoint]
                        self.delegate?.newSensor(sensor: sensor)
                    }else{
                        self.dataSource[sensor] = [dataPoint]
                        self.generalSensors.append(sensor)
                        self.generalSensors.sort()
                        self.delegate?.newSensor(sensor: sensor)
                    }
                }
                self.delegate?.manageMessage(key: sensorReading.key, dataPoint: dataPoint)
            } catch {
                print("Message decoded to an error")
            }
        }
        
        self.onComplete{ (status, shouldReconnect, netLayer) in
            //print("Data source at connection close was:")
            //print(self.dataSource)
            //print(self.favoriteSensors)
            //print(self.generalSensors)
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

//Has to be in this file because of fileprivate
extension Sensor{
    func addFavorite(){
        if(!Telemetry.shared.favoriteSensors.contains(self)){
            Telemetry.shared.favoriteSensors.append(self)
            Telemetry.shared.generalSensors.removeAll(where: {(sensor) in
                return sensor == self
            })
            saveFavorites()
        }
    }
    func removeFavorite(){
        if(Telemetry.shared.favoriteSensors.contains(self)){
            Telemetry.shared.generalSensors.append(self)
            Telemetry.shared.favoriteSensors.removeAll(where: {(sensor) in
                return sensor == self
            })
            saveFavorites()
        }
    }
    func saveFavorites(){
        //TODO
    }
}
