//
//  DockView.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/7/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
class DockMinimizedView: UIView, TelemetryDelegate{

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
    }
    
    func manageMessage(key: String, dataPoint: DataPoint) {
    }
    
    func manageOpen() {
    }
    
    func manageComplete() {
    }
    func newSensor(sensor: Sensor) {
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
}
