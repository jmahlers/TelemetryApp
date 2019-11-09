//
//  OverallTabViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/8/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//
import UIKit
class OverallTabViewController: UITabBarController, UITabBarControllerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 3
        self.delegate = self
    }
    
    /*
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: SettingViewController.self) {
            self.definesPresentationContext = true
            self.providesPresentationContextTransitionStyle = true
            overlayBlurredBackgroundView()
            self.performSegue(withIdentifier: "myModal", sender: self)
            return false
        }
        return true
    }
    func overlayBlurredBackgroundView() {
        
        let blurredBackgroundView = UIVisualEffectView()
        
        blurredBackgroundView.frame = view.frame
        blurredBackgroundView.effect = UIBlurEffect(style: .light)
        
        view.addSubview(blurredBackgroundView)
        
    }
    
    func removeBlurredBackgroundView() {
        
        for subview in view.subviews {
            if subview.isKind(of: UIVisualEffectView.self) {
                subview.removeFromSuperview()
            }
        }
    }
 */
}
