//
//  WeatherViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/13/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    class TableCell: UITableViewCell {
        var time: String!
        var icon: String?
        var Temperature: Float?
        var windSpeed: Float?
    }
//    var timeArray: [String] = []
//    var iconArray: [String] = []
//    var temperatureArray: [String] = []
//    var windSpeedArray: [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 48
    }
//
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style:  .default, reuseIdentifier: nil) as! TableCell
//        myCell.time = timeArray[indexPath.row]
//        myCell.icon = iconArray[indexPath.row]
//        myCell.Temperature = temperatureArray[indexPath.row]
//        myCell.windSpeed = windSpeedArray[indexPath.row]
        return myCell
    }
    
    //"Mohela", "Emerson", "Michigan International Speedway"
    var location : String?
    var urlAddress: String?
    
    @IBOutlet weak var WeatherTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(location=="Mohela"){
          urlAddress = "https://api.darksky.net/forecast/8b65e35335318ac7aedbdf595b9d8c0d/38.668321,-90.629687";
        }
        if(location=="Emerson"){
        urlAddress = "https://api.darksky.net/forecast/8b65e35335318ac7aedbdf595b9d8c0d/38.731915,-90.282067";
        }
        if(location=="Michigan Int. Speedway"){
          urlAddress =   "https://api.darksky.net/forecast/8b65e35335318ac7aedbdf595b9d8c0d/42.067915,-84.245076";
        }
        if(location=="Gateway"){
        urlAddress = "https://api.darksky.net/forecast/8b65e35335318ac7aedbdf595b9d8c0d/38.645869,-90.134260";
        }
        
        var url: URL =  URL(string: urlAddress!)!
        let data = try! Data(contentsOf: url)
        
        let JSON = try! JSONDecoder().decode(Weather.self, from: data)
        print(JSON)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
