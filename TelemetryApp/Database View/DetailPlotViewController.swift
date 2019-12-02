//
//  SelectSensorViewController.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 12/1/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import UIKit

class DetailPlotViewController : UIViewController {
    
    var start: String?
    var end: String?
    var varId: String?
//    var points:[Point]?
    
    let baseURL = "https://api.data.wuracing.com/api/"
    let queue = DispatchQueue(label: "async", qos: .userInitiated)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("in here")
        
        DispatchQueue.global().async {
            self.fetchPoints()
            
            DispatchQueue.main.sync {
                
                
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func fetchPoints() {
        
        if varId != nil && start != nil && end != nil {
            var urlString = baseURL+"runs/points/"
            urlString += start!+"/"+end!
            urlString += "/0/"+varId!
            guard let url = URL(string: urlString) else { return }
            
            print(urlString)
            print("in here")
            
            var data: Data?
            do {
                data = try Data(contentsOf: url)
            } catch {
                print("Data could not be retrieved from URL")
            }
            
            do {
                if data != nil {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [Any] {
                        print(json)
                    }
                }
            } catch {
                print("API results could not be decoded")
            }
        }
        
        
    }
    
}

