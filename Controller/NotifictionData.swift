//
//  NotifictionData.swift
//  Reminder
//
//  Created by Margankopp, Nagaraj (Contractor) on 12/05/23.
//

import Foundation
import UIKit
import UserNotifications

extension SecondScreen{
    func notificationData(title:String,date:Date,descrip:String,Type:String,priority:String){
        // content of notification
        let content = UNMutableNotificationContent()
        content.title = title
        content.sound = .default
        content.body = descrip
        
        
        
        
        let dateComponent = Calendar.current.dateComponents([.day,.month,.year,.hour,.minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        print(dateComponent)
        
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
}
