//
//  DockView.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/7/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
class DockView: UIView{
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var otherView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("DockView", owner: self, options: nil)
        Bundle.main.loadNibNamed("DockExpandedView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    func setOtherView(){
        contentView.removeFromSuperview()
        addSubview(otherView)
        otherView.frame = self.bounds
        otherView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    func setOGView(){
        otherView.removeFromSuperview()
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
