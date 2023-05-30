//
//  SecondScreen.swift
//  Reminder
//
//  Created by Margankopp, Nagaraj (Contractor) on 12/04/23.
//

import UIKit

    
    

class SecondScreen: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleL: UITextField!
    
    @IBOutlet weak var descripTV: UITextView!
    
    @IBOutlet weak var prioritySC: UISegmentedControl!
    
    @IBOutlet weak var typeSC: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        print(NSHomeDirectory())
        
        
     
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func saveB(_ sender: Any) {
        let title = titleL.text ?? ""
    
        if title.isEmpty  {
            print("enter title")
            ShowAlert()
        }else{
            
            let date = datePicker.date
            let descrip = descripTV.text ?? ""
            
            let priorityIndex = prioritySC.selectedSegmentIndex
            
            let priority = prioritySC.titleForSegment(at: priorityIndex)
            print(priority!)
            let typeIndex = typeSC.selectedSegmentIndex
            let type = typeSC.titleForSegment(at: typeIndex)
            print(type!)
            
            
            // storing data in core data
            reminderDetails.instance.addReminder(title: title, descrip: descrip, date: date, priority: priority ?? "", type: type ?? "")
            
            
            // Notification data
            notificationData(title: title, date: date, descrip: descrip, Type: type ?? "", priority: priority ?? "")
            
            
            
            
            navigationController?.popViewController(animated: true)
        }
    }
    func ShowAlert() {
        let alertVC = UIAlertController(title: "Title", message: "Enter tilte", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alertVC.addAction(alertAction)
        
        present(alertVC, animated: true)
        
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
