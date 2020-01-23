//
//  TelemetryViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/6/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

struct Run : Decodable {
    let id: Int!
    var location: String?
    var startDate: Date?
    var endDate: Date?
    var description: String?
    var type: String?
}

struct DaySection {
    var location: String!
    var date: Date!
    var runs: [Run]!
    var collapsed: Bool
    
    init(location: String, date: Date, runs: [Run], collapsed: Bool = false) {
        self.location = location
        self.date = date
        self.runs = runs
        self.collapsed = collapsed
    }
}

class DatabaseViewController : CollapsibleTableSectionViewController {
    
    var sections:[DaySection] = []
    var allRuns:[Run] = []
        
    let baseURL = "https://api.data.wuracing.com/api/"
    let queue = DispatchQueue(label: "async", qos: .userInitiated)
    let parseFormatter = DateFormatter()
    let dateFormatter = DateFormatter()
    let hourFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActivityIndicator()
        indicator.startAnimating()

        self.delegate = self

        self.reloadData()
        parseFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.dateFormat = "MM/dd/yyyy"
        hourFormatter.dateFormat = "HH:mm:ss"
        
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
                self.reloadData()
                self.indicator.stopAnimating()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    func fetchRuns() {
        guard let url = URL(string: baseURL+"runs") else { return }

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
                        print(runStartDateString == nil)
                        print("Run is" + runStartDateString!)
                        runStartDateString = runStartDateString?.replacingOccurrences(of: "T", with: " ") //I got this to work after a whole day. dont fucking touch the formats
                        runStartDateString = runStartDateString?.replacingOccurrences(of: "Z", with: "")

                        let runStartDate = parseFormatter.date(from: runStartDateString!)
                        print("RunstartDate is")
                        print(runStartDate)
                        var runEndDateString = j["end"] as? String
                        runEndDateString = runEndDateString?.replacingOccurrences(of: "T", with: " ") //I got this to work after a whole day. dont fucking touch the formats
                        runEndDateString = runEndDateString?.replacingOccurrences(of: "Z", with: "")
                        
                        let runEndDate = parseFormatter.date(from: runEndDateString!)
                        
                        let run = Run(id: j["id"] as? Int, location: j["location"] as? String, startDate: runStartDate, endDate: runEndDate, description: j["description"] as? String, type: j["type"] as? String)
                        print("run is")
                        print(run)
                        allRuns.append(run)
                    }
                }
            }
        } catch {
            print("API results could not be decoded")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectSensorVC = segue.destination as? SelectSensorViewController
        let cell = sender as! UITableViewCell
        
        if cell.textLabel?.text != nil {
            let runId = allRuns.first(where: { hourFormatter.string(from: $0.startDate ?? Date()) == cell.textLabel?.text })?.id
            selectSensorVC?.runId = runId?.description
            selectSensorVC?.allRuns = allRuns
        }
    }
    
    var indicator = UIActivityIndicatorView()
    
    func setupActivityIndicator() {
        indicator = UIActivityIndicatorView(frame: self.view.frame)
        indicator.style = UIActivityIndicatorView.Style.whiteLarge
        indicator.backgroundColor = UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        indicator.hidesWhenStopped = true
        self.view.addSubview(indicator)
    }
    
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
        
        if run.startDate != nil {
            
            cell?.textLabel?.text = hourFormatter.string(from: run.startDate!)
        }
        
        return cell ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
    }
    
    func collapsibleTableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func collapsibleTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        self.performSegue(withIdentifier: "selectSensor", sender: cell)
    }
    
    func collapsibleTableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].location + " - " + dateFormatter.string(from: sections[section].date)
    }
    
    func shouldCollapseByDefault(_ tableView: UITableView) -> Bool {
        return true
    }
    
    func shouldCollapseOthers(_ tableView: UITableView) -> Bool {
        return true
    }
}


