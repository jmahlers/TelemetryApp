//
//  TelemetryViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class DatabaseViewController : CollapsibleTableSectionViewController {
    
    var sections:[DaySection] = []
    
    let baseURL = "https://api.data.wuracing.com/api/"
    let queue = DispatchQueue(label: "async", qos: .userInitiated)
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        self.reloadData()
//        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
        
//        DispatchQueue.global().async {
//            self.fetchRuns()
//
//            DispatchQueue.main.sync {
//                for run in self.allRuns {
//                    var daySectionExistsForRun = false
//                    for i in 0..<self.sections.count {
//                        if Calendar.current.isDate(run.startDate ?? Date(), inSameDayAs: self.sections[i].date ?? Date()) {
//                            self.sections[i].runs?.append(run)
//                            daySectionExistsForRun = true
//                        }
//                    }
//
//                    if !daySectionExistsForRun {
//                        let daySection = DaySection(location: run.location ?? "", date: run.startDate ?? Date(), runs: [run])
//                        self.sections.append(daySection)
//                    }
//                }
//
//                print("done sorting")
//                self.reloadData()
//            }
//        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//    }
    
//    func fetchRuns() {
//        guard let url = URL(string: baseURL+"runs/") else { return }
//
//        var data: Data?
//        do {
//            data = try Data(contentsOf: url)
//        } catch {
//            print("Data could not be retrieved from URL")
//        }
//
//        do {
//            if data != nil {
//                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String:Any]]
//                if json != nil {
//                    for j in json! {
//                        
//                        var runStartDateString = j["date"] as? String
//                        runStartDateString = runStartDateString?.replacingOccurrences(of: "T", with: " ")
//                        runStartDateString = runStartDateString?.replacingOccurrences(of: "Z", with: "")
//                        
//                        let runStartDate = formatter.date(from: runStartDateString!)
//                        
//                        let run = Run(id: j["id"] as? Int, location: j["location"] as? String, startDate: runStartDate, endDate: j["end"] as? String, description: j["description"] as? String, type: j["type"] as? String)
//                        allRuns.append(run)
//                    }
//                }
//            }
//        } catch {
//            print("API results could not be decoded")
//        }
//    }
    
}

extension DatabaseViewController : CollapsibleTableSectionDelegate {
    
    func numberOfSections(_ tableView: UITableView) -> Int {
        return sections.count
    }
    
    func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].runs.count
    }
    
    func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let run : Run = sections[(indexPath as NSIndexPath).section].runs[(indexPath as NSIndexPath).row]
        
        cell?.textLabel?.text = String(run.id)
        
        return cell ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
    }
    
    func collapsibleTableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func collapsibleTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // get the run details
    }
    
    func collapsibleTableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].location
    }
    
    func shouldCollapseByDefault(_ tableView: UITableView) -> Bool {
        return true
    }
    
    func shouldCollapseOthers(_ tableView: UITableView) -> Bool {
        return true
    }
}


