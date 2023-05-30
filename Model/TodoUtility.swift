//
//  TodoUtility.swift
//  Reminder
//
//  Created by Margankopp, Nagaraj (Contractor) on 05/05/23.
//

import Foundation
import UIKit
struct reminderDetails{
    static var instance = reminderDetails()
    
    
    private let dbContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init(){
        
    }
    func addReminder(title:String,descrip:String,date:Date,priority:String,type:String){
        let detail = Todo(context: dbContext)
        detail.title = title
        detail.descrip = descrip
        detail.date = date
        detail.priority = priority
        detail.type = type
        
        
        do {
            try dbContext.save()
           
        }catch {
        
        }
            }
    func deleteReminder(detail:Todo){
        dbContext.delete(detail)
        do{
            try dbContext.save()
            print("details deleted : \(detail.title ?? "")")
        }catch{
            print("details could not be deleted:\(error.localizedDescription)")
        }
    }
    func GetAllData()->[Todo]{
        let todoList = Todo.fetchRequest()
        do{
            let result = try dbContext.fetch(todoList)
            return result
        }catch{
            return[]
        }
    }
    //get the task based on official or personal
    func getTaskByType(type:String)->[Todo]{
        let typereq = Todo.fetchRequest()
        typereq.predicate = NSPredicate(format: "type == %@", type)
        do {
            let result = try dbContext.fetch(typereq)
            return result
        }
        catch{
            return []
        }
    }
}


