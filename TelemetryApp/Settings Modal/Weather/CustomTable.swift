//
//  CustomTable.swift
//  TelemetryApp
//
//  Created by Jessie Page on 11/27/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class CustomTable: UITableViewCell {

    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var label3: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
