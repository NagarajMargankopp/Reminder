//
//  FirstScreen.swift
//  Reminder
//
//  Created by Margankopp, Nagaraj (Contractor) on 05/04/23.
//

import UIKit

class FirstScreen: UIViewController {
    var todoList:[Todo] = []
    
    
    @IBOutlet weak var tableV: UITableView!
    var isAuthorized = false
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableV.dataSource = self
        tableV.delegate = self
        checkNotificationPermission()
        UNUserNotificationCenter.current().delegate = self

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        todoList = reminderDetails.instance.GetAllData()
        tableV.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func sortSC(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            todoList = reminderDetails.instance.GetAllData()
        case 1:
            todoList = reminderDetails.instance.getTaskByType(type: "Personal")
        case 2:
            todoList = reminderDetails.instance.getTaskByType(type: "Official")
        default:
            break
        
        }
        tableV.reloadData()
    }
    @IBAction func addOption(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondvc")
       
        show(vc!, sender: self)
    }
}
extension FirstScreen:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! detailCell
        
        let task = todoList[indexPath.row]
        
        cell.titleCL.text = task.title
        cell.dateCL.text = task.date?.formatted()
        return cell
    }
    
    
}

extension FirstScreen:UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: UIContextualAction.Style.destructive, title: "Delete") { _, _, _ in
            print("Delete selected")
            let detailToDelete = self.todoList[indexPath.row]
            reminderDetails.instance.deleteReminder(detail:detailToDelete)
            self.todoList.remove(at: indexPath.row)
            self.tableV.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "remainderVC") as? thirdScreenViewController else {
            return
            
        }
        self.navigationController?.pushViewController(vc, animated: true)
        let getRemainderData = self.todoList[indexPath.row]
        vc.remainder = getRemainderData
        print(getRemainderData)
    }
    
    
    // get permission
    func checkNotificationPermission(){
        UNUserNotificationCenter.current().getNotificationSettings() { settings in
            switch  settings.authorizationStatus{
            case.notDetermined:
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { success, _ in
                    if success{
                        self.isAuthorized = true
                    }else{
                        self.isAuthorized = false
                    }
                }
                break
            case .authorized:
                self.isAuthorized = true
            case . denied:
                self.isAuthorized = false
            
            default:
                break
            
            }
        }
    }

}


extension FirstScreen:UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }
}



