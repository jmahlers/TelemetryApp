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
        if (collectionView == self.dockOutlet.expandedView.expandedDockCollection) {
            if (section == 0) {
                return Telemetry.shared.getFavoriteSensors().count
            } else {
                return Telemetry.shared.getGeneralSensors().count
            }
        } else {
            if (section == 0) {
                return Telemetry.shared.favoriteCharts.count
            } else {
                return Telemetry.shared.generalCharts.count
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.dockOutlet.expandedView.expandedDockCollection) {
            let sensor = ((indexPath.section == 0) ? Telemetry.shared.getFavoriteSensors()[indexPath.row] : Telemetry.shared.getGeneralSensors()[indexPath.row])
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DockExpandedCell", for: indexPath) as! DockExpandedCell
            cell.setCellValue(data: Telemetry.shared.dataSource[sensor]!.last!)
            return cell
            
        } else {
            
            let cell = graphView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! GraphCollectionViewCell
            
            if indexPath.section == 0 {
                cell.graphContainer.subviews.forEach({ $0.removeFromSuperview() })

                let key = Telemetry.shared.getFavoriteSensors()[indexPath.row].key
                cell.label.text = key
                
                let chart = Telemetry.shared.favoriteCharts[indexPath.row]
                chart.frame = cell.graphContainer.bounds
                cell.graphContainer.addSubview(chart)
                
                cell.isUserInteractionEnabled = true
                
                return cell
            } else {
                cell.graphContainer.subviews.forEach({ $0.removeFromSuperview() })
                
                let key = Telemetry.shared.getGeneralSensors()[indexPath.row].key
                cell.label.text = key
                
                let chart = Telemetry.shared.generalCharts[indexPath.row]
                chart.frame = cell.graphContainer.bounds
                cell.graphContainer.addSubview(chart)
                
                cell.isUserInteractionEnabled = true
                
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "myView", for: indexPath) as! HeaderView
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if collectionView == self.dockOutlet.expandedView.expandedDockCollection{
            return .zero
        }else{
            let size = CGSize(width: view.frame.width, height: 50.0)
            return size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.dockOutlet.expandedView.expandedDockCollection {
            let size = CGSize(width: view.frame.width*0.45, height: 60)
            return size
        } else {
            return CGSize(width: view.frame.width*0.48, height: 220)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = graphView.cellForItem(at: indexPath)
        self.performSegue(withIdentifier: "detailLiveGraph", sender: cell)
    }
    
}
