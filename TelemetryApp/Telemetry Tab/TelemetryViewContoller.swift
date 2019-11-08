//
//  TelemetryViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class TelemetryViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var DockOutlet: DockManager!
    @IBOutlet var dockHeight: NSLayoutConstraint!
    @IBOutlet weak var graphView: UICollectionView!
    
    var panGesture = UIPanGestureRecognizer()
    var upwardState = false
    var headerHeight:CGFloat = 50
    //var headerView = HeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.dataSource = self
        graphView.delegate = self
        DockOutlet.setUp(DockOutlet.minimizedView)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(TelemetryViewController.draggedView(_:)))
        DockOutlet.isUserInteractionEnabled = true
        DockOutlet.addGestureRecognizer(panGesture)
        DockOutlet.roundCorners(cornerRadius: 12.5)
    }
    
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        let inset = view.safeAreaInsets.top + view.safeAreaInsets.bottom
        let upwardTop = view.frame.height - inset    //Portion of screen to fill
        let upwardHeight = upwardTop*0.93 - headerHeight //Account for static height multiplier in storyboard
        
        switch sender.state{
        case .began:
            //DockOutlet.makeOpaque()
            break
            
        case .changed:
            let translation = sender.translation(in: self.view)
            if(dockHeight.constant - translation.y >= upwardHeight){
                dockHeight.constant = upwardHeight
            }else if(dockHeight.constant - translation.y <= 0){
                dockHeight.constant = 0
            }else{
                dockHeight.constant -= translation.y
            }
            sender.setTranslation(CGPoint.zero, in: self.view)
            break
            
        case .ended:
            if(DockOutlet.bounds.height > upwardTop*0.2 && sender.velocity(in: self.view).y<0){
                dockHeight.constant = upwardHeight
                upwardState = true
                UIView.animate(withDuration: 0.13, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion:  {(_) in
                    self.DockOutlet.expandDock()
                })
            }else if(DockOutlet.bounds.height < upwardTop*0.85 && sender.velocity(in: view).y>0){
                dockHeight.constant = 0
                upwardState = false
                UIView.animate(withDuration: 0.13, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion:  {(_) in
                    self.DockOutlet.minimizeDock()
                })
            }else{
                if(upwardState == true){
                    dockHeight.constant = upwardHeight
                }else{
                    dockHeight.constant = 0
                }
                UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                }, completion:  nil)
            }
            break
            
        default:
            break
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = graphView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "myView", for: indexPath) as! HeaderView
        return headerView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = CGSize(width: view.frame.width, height: headerHeight)
        return size
    }
}
