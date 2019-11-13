//
//  TelemetryViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

struct Run : Decodable {
    let id : Int!
    var location: String?
    var startDate: Date?
    var endDate: String?
    var description: String?
    var type: String?
}

struct AllRunResults : Decodable {
    let runResults : String
}

class DatabaseViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var table: UITableView!
    
    let baseURL = "https://api.data.wuracing.com/api/"
    
    let queue = DispatchQueue(label: "async", qos: .userInitiated)

    var runs:[Run] = []
//    var runsByDate:[Run:Date] = [:]
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"

        
        DispatchQueue.global().async {
            self.fetchRuns()
            
            DispatchQueue.main.async {
//                for run in self.runs {
//                    print(run)
//                }
                self.table.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        table.dataSource = self
        table.delegate = self
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
                        
                        
                        print(runStartDateString)
                        let runStartDate = formatter.date(from: runStartDateString!)
                        print(runStartDate)
                        
                        let run = Run(id: j["id"] as? Int, location: j["location"] as? String, startDate: runStartDate, endDate: j["end"] as? String, description: j["description"] as? String, type: j["type"] as? String)
                        runs.append(run)
                    }
                }
            }
        } catch {
            print("API results could not be decoded")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return runs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let date = runs[indexPath.row].startDate {
            cell.textLabel?.text = formatter.string(from: runs[indexPath.row].startDate!)

        }
        return cell
    }
    
}


