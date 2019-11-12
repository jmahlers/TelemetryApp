//
//  SettingsViewController.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/11/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{


    @IBOutlet weak var settingsTable: UITableView!
//    var height = CGFloat(350)
//    var width = CGFloat(190)
    var settings:[String] = ["Bug Report", "Console","Dock Options","Favorites","Settings"]
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTable.dataSource = self
        settingsTable.delegate = self
         let cellNib = UINib(nibName: "SettingsCell", bundle: nil)
        settingsTable.register(cellNib, forCellReuseIdentifier: "SettingsCell")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTable.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
        cell.backgroundColor = UIColor.clear
        cell.settingLabel.text = settings[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 1:
            self.performSegue(withIdentifier: "ShowBugReport", sender: self)
            break
        default:
            self.performSegue(withIdentifier: "ShowBugReport", sender: self)
            break
        }
    }
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height);
    }
}
