//
//  FavoritesSettingController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 12/1/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class FavoritesSettingsController: UIViewController, UITableViewDataSource, UITableViewDelegate,TelemetryDelegate, FavoritesDelegate {
    @IBOutlet weak var favoritesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTable.dataSource = self
        favoritesTable.delegate = self
        
        // Do any additional setup after loading the view.
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
        let cell =  tableView.dequeueReusableCell(withIdentifier: "myCell") as! FavoritesCell
        if(indexPath.section == 0){
            cell.isFavorite.isOn = true
            cell.sensorLabel.text = favoriteSensors[indexPath.row].key
        }else{
            cell.isFavorite.isOn = false
            cell.sensorLabel.text = generalSensors[indexPath.row].key
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
        favoritesTable.reloadData()
    }
    func favoritesChanged() {
        favoritesTable.reloadData()
    }
}
