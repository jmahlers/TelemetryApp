//
//  FavoritesCell.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 12/1/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {

    @IBOutlet weak var sensorLabel: UILabel!
    @IBOutlet weak var isFavorite: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func flippedSwitch(_ sender: Any) {
        //Behavior is flipped from expected since isOn is measured after the switch flips
        let sensor = Sensor(key: sensorLabel.text ?? "Error Occured")
        if(isFavorite.isOn){
            sensor.addFavorite()
        }else{
            sensor.removeFavorite()
        }
    }
}
