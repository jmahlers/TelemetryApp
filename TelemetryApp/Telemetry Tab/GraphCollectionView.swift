//
//  GraphCollectionView.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/8/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//
import UIKit
import Foundation
extension TelemetryViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charts.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = graphView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! GraphCollectionViewCell
        
        let key = Telemetry.shared.getGeneralSensors()[indexPath.row].key
        
        cell.graph.setUp(key: key)
        cell.graph.delegate = self
        charts.append(cell.graph)
        
        cell.label.text = key
        
        updateChartData()

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
