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
    var varName: String?
    var varUnits: String?
    @IBOutlet weak var chart: DetailSciChart!
    @IBOutlet weak var plotTitle: UINavigationItem!
    var points:[DataPoint] = []
    
    let baseURL = "https://api.data.wuracing.com/api/"
    let queue = DispatchQueue(label: "async", qos: .userInitiated)
    let parseFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if varName != nil && varUnits != nil {
            plotTitle.title = varName! + " (" + varUnits! + " vs. s)"
        } else if varName != nil {
            plotTitle.title = varName! + " (? vs. s)"
        } else {
            plotTitle.title = "?"
        }
        
        setupActivityIndicator()
        indicator.startAnimating()
        
        
        
        print("in here Detail")
        parseFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'" //I got this to work after a whole day. dont fucking touch the formats
        
        DispatchQueue.global().async {
            self.fetchPoints()
            
            DispatchQueue.main.sync {
                
                if self.varName != nil {
                    self.chart.initialize(key: self.varName!)
                    for point in self.points {
                        self.chart.appendDataPointToDataSeries(dataPoint: point)
                    }
                }
                
                self.indicator.stopAnimating()
                
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func fetchPoints() {
        print("fetchingPoints")
        if varId != nil && start != nil && end != nil {
            var urlString = baseURL+"runs/points/"
            urlString += start!+"/"+end!
            urlString += "/0/"+varId!
            guard let url = URL(string: urlString) else { return }
            
            print(urlString)
            print("in here fetching points")
            
            var data: Data?
            do {
                data = try Data(contentsOf: url)
            } catch {
                print("Data could not be retrieved from URL")
            }
            
            do {
                if data != nil {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                        
                        var firstPointRead = false
                        var timeScaleFactor: Double = 0.0
                        for j in json {
                            var time = j["time"] as? String
                            //I got this to work after a whole day. dont fucking touch the formats
                            time = time?.replacingOccurrences(of: "Z", with: "")
                            let timeDate = parseFormatter.date(from: time!)
                            
                            if !firstPointRead {
                                timeScaleFactor = timeDate?.timeIntervalSince1970 ?? 0
                                firstPointRead = true
                            }
                            
                            if varName != nil {
                                if let floatValue = (j[varName!] as? NSNumber)?.floatValue {
                                    points.append(DataPoint(key: varName!, time: (timeDate?.timeIntervalSince1970 ?? 0.0) - timeScaleFactor, value: floatValue))
                                }
                            }
                        }
                    }
                }
            } catch {
                print("API results could not be decoded")
            }
        }
    }
    
    var indicator = UIActivityIndicatorView()
    
    func setupActivityIndicator() {
        indicator = UIActivityIndicatorView(frame: self.view.frame)
        indicator.style = UIActivityIndicatorView.Style.whiteLarge
        indicator.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
        indicator.hidesWhenStopped = true
        self.view.addSubview(indicator)
    }
    
}

