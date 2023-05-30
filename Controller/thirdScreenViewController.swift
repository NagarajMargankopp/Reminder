//
//  thirdScreenViewController.swift
//  Reminder
//
//  Created by Margankopp, Nagaraj (Contractor) on 08/05/23.
//

import UIKit

class thirdScreenViewController: UIViewController {

    
    @IBOutlet weak var titleL: UILabel!
 
    @IBOutlet weak var dateL: UILabel!
    @IBOutlet weak var descripL: UILabel!
    
    var remainder : Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleL.text = remainder?.title
        descripL.text = remainder?.descrip
        dateL.text = remainder?.date?.formatted()
      

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
