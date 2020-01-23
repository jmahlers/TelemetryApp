//
//  DockOptionsCell.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 12/1/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class DockOptionsCell: UITableViewCell {
    @IBOutlet weak var sensorLabel: UILabel!
    @IBOutlet weak var isPinned: UISwitch!
    var cellSensor: Sensor?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func flippedSwitch(_ sender: Any) {
        if(cellSensor != nil){
            let sensor = cellSensor!
            if(isPinned.isOn){
                let successful = sensor.pin()
                if(!successful){
                    isPinned.isOn = false
                }
            }else{
                sensor.unpin()
            }
        }else{
            //Fall back if cell is not properly configured
            let sensor = Sensor(key: sensorLabel.text ?? "Error Occured")
            if(isPinned.isOn){
                let successful = sensor.pin()
                if(!successful){
                    isPinned.isOn = false
                }
            }else{
                sensor.unpin()
            }
        }
    }
}
