//
//  DockOptionsController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 12/1/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class DockOptionsController: UIViewController, UITableViewDataSource, UITableViewDelegate,TelemetryDelegate, FavoritesDelegate {

    @IBOutlet weak var dockOptionsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dockOptionsTable.dataSource = self
        dockOptionsTable.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        Telemetry.shared.delegate = self
        Telemetry.shared.favoritesDelegate = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == 0){
            return Telemetry.shared.getFavoriteSensors().count
        }else{
            return Telemetry.shared.getGeneralSensors().count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favoriteSensors = Telemetry.shared.getFavoriteSensors()
        let generalSensors = Telemetry.shared.getGeneralSensors()
        let cell =  tableView.dequeueReusableCell(withIdentifier: "myDockOptionsCell") as! DockOptionsCell
        let sensor = (indexPath.section == 0 ? favoriteSensors[indexPath.row]:generalSensors[indexPath.row])
        let pinnedState = Telemetry.shared.pinnedSensors.contains(sensor)
        if(indexPath.section == 0){
            cell.isPinned.isOn = pinnedState
            cell.sensorLabel.text = sensor.key
            cell.cellSensor = sensor
        }else{
            cell.isPinned.isOn = pinnedState
            cell.sensorLabel.text = sensor.key
            cell.cellSensor = sensor
        }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return "Favorite Sensors"
        }
        else{
            return "General Sensors"
        }
    }
    func manageMessage(key: String, dataPoint: DataPoint) {
    }
    
    func manageOpen() {
    }
    
    func manageComplete() {
    }
    
    func newSensor(sensor: Sensor) {
        dockOptionsTable.reloadData()
    }
    func favoritesChanged() {
        dockOptionsTable.reloadData()
    }
}
