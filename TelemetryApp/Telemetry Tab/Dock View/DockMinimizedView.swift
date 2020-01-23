//
//  DockView.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/7/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
class DockMinimizedView: UIView, TelemetryDelegate, PinnedDelegate{

    @IBOutlet var contentView: UIView!
    @IBOutlet var dragBar: UIView!
    
    @IBOutlet weak var ZeroNum: UILabel!
    @IBOutlet weak var ZeroUnit: UILabel!
    @IBOutlet weak var OneNum: UILabel!
    @IBOutlet weak var OneUnit: UILabel!
    @IBOutlet weak var TwoNum: UILabel!
    @IBOutlet weak var TwoUnit: UILabel!
    @IBOutlet weak var ThreeNum: UILabel!
    @IBOutlet weak var ThreeUnit: UILabel!
    
    var pinnedSensors: [Sensor]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("DockMinimizedView", owner: self, options: nil)
        dragBar.layer.cornerRadius = dragBar.frame.height/2
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        pinnedSensors = Telemetry.shared.pinnedSensors
        updateLabels()
        Telemetry.shared.pinnedDelegate = self
    }
    
    func manageMessage(key: String, dataPoint: DataPoint) {
        let sensor = Sensor(key: key )
        let value = String(format: "%.2f", dataPoint.value)
        if(pinnedSensors?.contains(sensor) ?? false){
            switch pinnedSensors?.firstIndex(of: sensor){
            case 0:
                ZeroNum.text = value
                return
            case 1:
                OneNum.text = value
                return
            case 2:
                TwoNum.text = value
                return
            case 3:
                ThreeNum.text = value
                return
            default:
                return
            }
        }
    }
    
    func manageOpen() {
    }
    
    func manageComplete() {
    }
    func newSensor(sensor: Sensor) {
    }
    func pinnedChanged() {
        pinnedSensors = Telemetry.shared.pinnedSensors
        updateLabels()
    }
    func setAlpha(_ alpha: CGFloat){
        ZeroNum.alpha = alpha
        ZeroUnit.alpha = alpha
        OneNum.alpha = alpha
        OneUnit.alpha = alpha
        TwoNum.alpha = alpha
        TwoUnit.alpha = alpha
        ThreeNum.alpha = alpha
        ThreeUnit.alpha = alpha
    }
    func updateLabels(){
        switch pinnedSensors?.count {
        case 1:
            ZeroNum.text = ""
            OneNum.text = ""
            TwoNum.text = ""
            ThreeNum.text = ""
            
            //ZeroUnit.text = pinnedSensors?[0].unit
            ZeroUnit.text = "V"
            OneUnit.text = ""
            TwoUnit.text = ""
            ThreeUnit.text = ""
            return
        case 2:
            ZeroNum.text = ""
            OneNum.text = ""
            TwoNum.text = ""
            ThreeNum.text = ""
            
           // ZeroUnit.text = pinnedSensors?[0].unit
          //  OneUnit.text = pinnedSensors?[1].unit
            ZeroUnit.text = "V"
            OneUnit.text = "mm"
            TwoUnit.text = ""
            ThreeUnit.text = ""
            return
        case 3:
            ZeroNum.text = ""
            OneNum.text = ""
            TwoNum.text = ""
            ThreeNum.text = ""
            
            
            //ZeroUnit.text = pinnedSensors?[0].unit
            //OneUnit.text = pinnedSensors?[1].unit
            //TwoUnit.text = pinnedSensors?[2].unit
            ZeroUnit.text = "V"
            OneUnit.text = "mm"
            TwoUnit.text = "N"
            ThreeUnit.text = ""
            return
        case 4:
            ZeroNum.text = ""
            OneNum.text = ""
            TwoNum.text = ""
            ThreeNum.text = ""
            
            ZeroUnit.text = "V"
            OneUnit.text = "mm"
            TwoUnit.text = "N"
            ThreeUnit.text = "C"
            //ZeroUnit.text = pinnedSensors?[0].unit
            //OneUnit.text = pinnedSensors?[1].unit
            //TwoUnit.text = pinnedSensors?[2].unit
            //ThreeUnit.text = pinnedSensors?[3].unit
            return
        default:
            ZeroNum.text = ""
            OneNum.text = ""
            TwoNum.text = ""
            ThreeNum.text = ""
            
            ZeroUnit.text = ""
            OneUnit.text = ""
            TwoUnit.text = ""
            ThreeUnit.text = ""
            return
        }
    }
    
}
