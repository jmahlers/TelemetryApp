//
//  Extensions.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/7/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//
import UIKit

extension UIView {
    func setUp(_ currentView:UIView){
        addSubview(currentView)
        currentView.frame = self.bounds
        currentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func roundCorners(cornerRadius: CGFloat) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
