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

    var runId: String?
    var variables:[Variable]?
    
    @IBOutlet weak var tableView: UITableView!
    
    let baseURL = "https://api.data.wuracing.com/api/"
    let queue = DispatchQueue(label: "async", qos: .userInitiated)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        print("loaded select sensor view")
        
        DispatchQueue.global().async {
            self.fetchSensors()
            
            DispatchQueue.main.sync {
                self.tableView.reloadData()

            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func fetchSensors() {
        
        if runId != nil {
            guard let url = URL(string: baseURL+"runs/"+runId!+"/details/") else { return }
            
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
    
}

