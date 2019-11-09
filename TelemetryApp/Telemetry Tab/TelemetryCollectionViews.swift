//
//  GraphCollectionView.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/8/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//
import UIKit

extension TelemetryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == self.dockOutlet.expandedView.expandedDockCollection){
            if (section == 0){
                return Telemetry.shared.getFavoriteSensors().count
            }else{
                return Telemetry.shared.getGeneralSensors().count
            }
        }else{
            return charts.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == self.dockOutlet.expandedView.expandedDockCollection){
            let sensor = ((indexPath.section == 0) ? Telemetry.shared.getFavoriteSensors()[indexPath.row] : Telemetry.shared.getGeneralSensors()[indexPath.row])
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DockExpandedCell", for: indexPath) as! DockExpandedCell
            cell.setCellValue(data: Telemetry.shared.dataSource[sensor]!.last!)
            return cell
            
        }else{
            
            let cell = graphView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! GraphCollectionViewCell
            let key = Telemetry.shared.getGeneralSensors()[indexPath.row].key
            cell.label.text = key
            let chart = charts[indexPath.row]
            chart.frame=cell.graph.bounds
            cell.graph = chart
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "myView", for: indexPath) as! HeaderView
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(upwardState){
            return .zero
        }else{
            let size = CGSize(width: view.frame.width, height: 50.0)
            return size
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.dockOutlet.expandedView.expandedDockCollection{
            let size = CGSize(width: view.frame.width*0.45, height: 80)
            return size
        }else{
            return CGSize(width: view.frame.width*0.3, height: 400)
        }
    }
    
}
