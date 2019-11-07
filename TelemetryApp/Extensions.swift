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
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
