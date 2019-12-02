//
//  DraggableDock.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/8/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//
import UIKit

extension TelemetryViewController{
    
    ///Sets dock to expanded position with no animation and transitions view
    func forceExpand(){
        //This closure makes the starting screen the top bar
        let inset:CGFloat = 127 //Experimentally found
        let upwardTop = view.frame.height - inset    //Portion of screen to fill
        let upwardHeight = upwardTop*(1-dockHeight.multiplier)
        self.dockHeight.constant = upwardHeight - topViewHeight.constant
        self.dockOutlet.expandDock(time: 0.0)
        self.upwardState = true
    }
    
    ///Sets dock to minimized position with no animation and transitions view
    func forceMinimize(){
        self.dockHeight.constant = 0
        self.dockOutlet.minimizeDock(time: 0.0)
        self.upwardState = false
    }
    
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        
        let inset = view.safeAreaInsets.top + view.safeAreaInsets.bottom
        let upwardTop = view.frame.height - inset    //Portion of screen to fill
        let upwardHeight = upwardTop*(1-dockHeight.multiplier) - topViewHeight.constant //Account for static height multiplier in storyboard
        let transitionHeight = upwardHeight*0.08
        switch sender.state{
        case .began:
            dockDidTransition = false
            break
            
        case .changed:
            let translation = sender.translation(in: self.view).y*1.3
            if(dockHeight.constant - translation >= upwardHeight){
                dockHeight.constant = upwardHeight
            }else if(dockHeight.constant - translation <= 0){
                dockHeight.constant = 0
            }else{
                dockHeight.constant -= translation
            }
            if(!upwardState){
                
                if(!dockDidTransition && dockHeight.constant > transitionHeight){
                    dockDidTransition = true
                    dockOutlet.expandDock(time: 0.0)
                }else if(dockDidTransition && dockHeight.constant<transitionHeight){
                    dockDidTransition = false
                    dockOutlet.minimizeDock(time: 0.0)
                }
            }else{
                if(!dockDidTransition && dockHeight.constant < transitionHeight){
                    dockDidTransition = true
                    dockOutlet.minimizeDock(time: 0.0)
                }else if(dockDidTransition && dockHeight.constant>transitionHeight){
                    dockDidTransition = false
                    dockOutlet.expandDock(time: 0.0)
                }
            }
            if(dockHeight.constant<transitionHeight){
                dockOutlet.setAlpha(1-dockHeight.constant*dockHeight.constant/(transitionHeight*transitionHeight))
            }else{
                dockOutlet.setAlpha((dockHeight.constant-transitionHeight)*(dockHeight.constant-transitionHeight)/((upwardHeight-transitionHeight)*(upwardHeight-transitionHeight)))
            }
            sender.setTranslation(CGPoint.zero, in: self.view)
            break
            
        case .ended:
            if(dockHeight.constant > transitionHeight && !upwardState){
                upwardState = true
                UIView.animate(withDuration: 0.35, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.dockHeight.constant = upwardHeight
                    self.dockOutlet.setAlpha(1)
                    self.view.layoutIfNeeded()
                }, completion:  {(_) in
                })
            }else if((dockHeight.constant < upwardHeight*0.45 && upwardState) || (upwardState && sender.velocity(in: self.view).y > 0.1) ){
                
                upwardState = false
                
                let duration:CGFloat = 0.35
                UIView.animate(withDuration: Double(duration*(1-transitionHeight/upwardHeight)), delay: 0.0, options: .curveLinear, animations: {
                    self.dockOutlet.setAlpha(0)
                    self.dockHeight.constant = transitionHeight
                    self.view.layoutIfNeeded()
                }, completion: {(_) in
                    self.dockOutlet.minimizeDock(time: 0.0)
                    UIView.animate(withDuration: Double(duration*transitionHeight/upwardHeight), delay: 0.0, options: .curveLinear, animations: {
                        self.dockOutlet.setAlpha(1)
                        self.dockHeight.constant = 0
                        self.view.layoutIfNeeded()
                    }, completion:  {(_) in
                    })
                })
            }else{
                if(upwardState == true){
                    dockHeight.constant = upwardHeight
                }else{
                    dockHeight.constant = 0
                    dockOutlet.minimizeDock(time: 0.2)
                }
                UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseIn, animations: {
                    
                    self.dockOutlet.setAlpha(1)
                    self.view.layoutIfNeeded()
                }, completion:  {(_) in
                    
                })
            }
            break
            
        default:
            break
        }
    }
    
}
