//
//  SelectSensorViewController.swift
//  TelemetryApp
//
//  Created by Jake Kendrick on 12/1/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import Foundation
import UIKit

struct LoadVariables : Decodable {
    let variables: [Variable]
}

struct Variable : Decodable {
    let id: Int!
    let name: String?
    let units: String?
    let description: String?
}

class SelectSensorViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return variables?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = variables?[indexPath.row].name
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        self.performSegue(withIdentifier: "detailGraph", sender: cell)
    }

    var runId: String?
    var variables:[Variable]?
    var allRuns:[Run]?

    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var tableView: UITableView!
    
    let baseURL = "https://api.data.wuracing.com/api/"
    let queue = DispatchQueue(label: "async", qos: .userInitiated)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        indicator.startAnimating()
        
        tableView.delegate = self
        tableView.dataSource = self
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'" //I got this to work after a whole day. dont fucking touch the formats
        
        print("loaded select sensor view")
        
        DispatchQueue.global().async {
            self.fetchSensors()
            
            DispatchQueue.main.sync {
                self.tableView.reloadData()
                self.indicator.stopAnimating()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func fetchSensors() {
        
        if runId != nil {
            guard let url = URL(string: baseURL+"runs/"+runId!+"/details") else { return }
            
            var data: Data?
            do {
                data = try Data(contentsOf: url)
            } catch {
                print("Data could not be retrieved from URL")
            }
            
            do {
                if data != nil {
                    let loadVariables = try JSONDecoder().decode(LoadVariables.self, from: data!)
                    variables = loadVariables.variables
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailPlotVC = segue.destination as? DetailPlotViewController
        let cell = sender as! UITableViewCell
        
        if cell.textLabel?.text != nil {
            let variable = variables?.first(where: { $0.name == cell.textLabel?.text })
            detailPlotVC?.varId = variable?.id.description
            detailPlotVC?.varName = variable?.name
            detailPlotVC?.varUnits = variable?.units
            if let currRun: Run = allRuns?.first(where: { $0.id == Int(runId!) }) {
                detailPlotVC?.start = dateFormatter.string(from: currRun.startDate ?? Date())
                detailPlotVC?.end = dateFormatter.string(from: currRun.endDate ?? Date())
            }
        }
    }
    
}

