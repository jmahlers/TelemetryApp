//
//  LoadCollapsibleDataVC.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 11/13/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import UIKit



class LoadCollapsibleDataVC : UIViewController {
    
    var sections:[DaySection] = []
    var allRuns:[Run] = []
    
    let baseURL = "https://api.data.wuracing.com/api/"
    let queue = DispatchQueue(label: "async", qos: .userInitiated)
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
        
        DispatchQueue.global().async {
            self.fetchRuns()
            
            DispatchQueue.main.sync {
                for run in self.allRuns {
                    var daySectionExistsForRun = false
                    for i in 0..<self.sections.count {
                        if Calendar.current.isDate(run.startDate ?? Date(), inSameDayAs: self.sections[i].date ?? Date()) {
                            self.sections[i].runs?.append(run)
                            daySectionExistsForRun = true
                        }
                    }
                    
                    if !daySectionExistsForRun {
                        let daySection = DaySection(location: run.location ?? "", date: run.startDate ?? Date(), runs: [run])
                        self.sections.append(daySection)
                    }
                }
                
                print("done sorting")
                
                self.performSegue(withIdentifier: "doneLoading", sender: self)
                print("segued")
            }
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneLoading" {
            if let databaseVC = segue.destination as? DatabaseViewController {
                databaseVC.sections = self.sections
            }
        }
    }
    
    func fetchRuns() {
        guard let url = URL(string: baseURL+"runs/") else { return }
        
        var data: Data?
        do {
            data = try Data(contentsOf: url)
        } catch {
            print("Data could not be retrieved from URL")
        }
        
        do {
            if data != nil {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String:Any]]
                if json != nil {
                    for j in json! {
                        
                        var runStartDateString = j["date"] as? String
                        runStartDateString = runStartDateString?.replacingOccurrences(of: "T", with: " ")
                        runStartDateString = runStartDateString?.replacingOccurrences(of: "Z", with: "")
                        
                        let runStartDate = formatter.date(from: runStartDateString!)
                        
                        let run = Run(id: j["id"] as? Int, location: j["location"] as? String, startDate: runStartDate, endDate: j["end"] as? String, description: j["description"] as? String, type: j["type"] as? String)
                        allRuns.append(run)
                    }
                }
            }
        } catch {
            print("API results could not be decoded")
        }
    }
    
}


