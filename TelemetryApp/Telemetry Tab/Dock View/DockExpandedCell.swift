//
//  DockExpandedCell.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/9/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class DockExpandedCell: UICollectionViewCell {

    @IBOutlet var sensorName: UILabel!
    @IBOutlet var sensorValue: UILabel!
    
    let cellIdentifier = "DockExpandedCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func setCellValue(data: DataPoint){
        self.sensorName.text = data.key+":"
        self.sensorValue.text = String(data.value)
    }
}
