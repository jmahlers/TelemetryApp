//
//  WeatherModalController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/13/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class WeatherModalController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var weatherTable: UITableView!
    var fromView:UIViewController?
    var height = CGFloat(185)
    var width = CGFloat(190)
    var locations:[String] = ["Emerson","Gateway", "Michigan Int. Speedway", "Mohela"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        weatherTable.dataSource = self
        weatherTable.delegate = self
        let cellNib = UINib(nibName: "ModalCell", bundle: nil)
        weatherTable.register(cellNib, forCellReuseIdentifier: "ModalCell")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTable.dequeueReusableCell(withIdentifier: "ModalCell", for: indexPath) as! ModalCell
        cell.backgroundColor = UIColor.clear
        cell.cellLabel.text = locations[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
        let senderKey = locations[indexPath.row]
        self.fromView?.performSegue(withIdentifier: "showWeather", sender: senderKey)
        self.fromView?.removeBlurs()
    }
}
