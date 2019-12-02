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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func flippedSwitch(_ sender: Any) {
    }
}
