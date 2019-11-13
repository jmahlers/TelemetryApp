import UIKit

class SettingsModalController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var settingsTable: UITableView!
    var fromView:UIViewController?
    var height = CGFloat(350)
    var width = CGFloat(190)
    var settings:[String] = ["Bug Report", "Console","Dock Options","Favorites","Settings"]
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTable.dataSource = self
        settingsTable.delegate = self
        let cellNib = UINib(nibName: "ModalCell", bundle: nil)
        settingsTable.register(cellNib, forCellReuseIdentifier: "ModalCell")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTable.dequeueReusableCell(withIdentifier: "ModalCell", for: indexPath) as! ModalCell
        cell.backgroundColor = UIColor.clear
        cell.cellLabel.text = settings[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
        self.fromView?.performSegue(withIdentifier: "showBugReport", sender: self)
        self.fromView?.removeBlurs()
        //        switch indexPath.row{
        //        case 1:
        //            self.presentingViewController?.performSegue(withIdentifier: "bug2", sender: self)
        //            break
        //        default:
        //            self.presentingViewController?.performSegue(withIdentifier: "bug2", sender: self)
        //            break
        //        }
    }
    
    // This function is called before the segue
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     segue.destination.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height);
     }
     */
}
