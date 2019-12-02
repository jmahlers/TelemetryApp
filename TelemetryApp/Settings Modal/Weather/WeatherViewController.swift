//
//  WeatherViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/13/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var Summary: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var timeArray: [Int] = []
    var iconArray: [String] = []
    var temperatureArray: [Float] = []
    var windSpeedArray: [Float] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! CustomTable
        
        if !timeArray.isEmpty{
            if timeArray[indexPath.row]<12{
                if timeArray[indexPath.row]==0{
                    myCell.label1.text = "12a.m."
                }
                else {
                    myCell.label1.text = timeArray[indexPath.row].description + "a.m."
                    
                }
            }
            else{
                let temp = timeArray[indexPath.row] - 12
                
                if temp==0{
                    myCell.label1.text = "12p.m."
                }
                else {
                    myCell.label1.text = temp.description + "p.m."
                    
                }
            }
            myCell.label2.text = temperatureArray[indexPath.row].description
            myCell.label3.text = windSpeedArray[indexPath.row].description
            
            if iconArray[indexPath.row] == "0"{
                myCell.image1.image = UIImage(named: "question-mark" + ".png")
            }
            else{
                myCell.image1.image = UIImage(named: iconArray[indexPath.row] + ".png")
            }
        }
        
        return myCell
    }
    
    //"Mohela", "Emerson", "Michigan International Speedway"
    var location : String?
    var urlAddress: String?
    
    @IBOutlet weak var WeatherTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationLabel.text = location
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
        let url: URL =  URL(string: urlAddress!)!
        let data = try! Data(contentsOf: url)
        
        let JSON = try! JSONDecoder().decode(Weather.self, from: data)
        
        // Do any additional setup after loading the view.
        var countValue = 0;
        var currentHour = Calendar.current.component(.hour, from: Date())
        Summary.text = "Current Weather Description: " + JSON.hourly.summary! 
        
        while countValue<24 {
            
            timeArray.append(Int(currentHour))
            iconArray.append(JSON.hourly.data[countValue].icon ?? "0")
            temperatureArray.append(JSON.hourly.data[countValue].temperature! )
            windSpeedArray.append(JSON.hourly.data[countValue].windSpeed! )
            countValue = countValue+1
            if currentHour<23{
                currentHour = currentHour+1
            }
            else{
                currentHour=0
            }
        }
    }
    
}
