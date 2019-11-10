//
//  DockExpandedView.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/7/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
class DockExpandedView: UIView, TelemetryDelegate{
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var expandedDockCollection: UICollectionView!
    @IBOutlet var dragBar: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("DockExpandedView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        dragBar.layer.cornerRadius = dragBar.frame.height/2
    }
    
    func setAlpha(_ alpha: CGFloat){
        expandedDockCollection.alpha = alpha
    }
    
    func manageMessage(key: String, dataPoint: DataPoint) {
    }
    
    func manageOpen() {
    }
    
    func manageComplete() {
    }
    func newSensor(sensor: Sensor) {
    }
}
