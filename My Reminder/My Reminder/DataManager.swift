//
//  DataManager.swift
//  My Reminder
//
//  Created by Aaron Lee on 2020-11-21.
//

import CoreData
import Foundation
import UIKit

final class DataManager {
    
    static let shared = DataManager(moc: NSManagedObjectContext.current)
    
    var managedContext: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.managedContext = moc
    }
    
    // GET RECORDS
    func getReminders() -> [Reminder] {
        var reminders = [Reminder]()
        let rdRequest: NSFetchRequest<Reminder> = Reminder.fetchRequest()
        
        do {
            reminders = try self.managedContext.fetch(rdRequest)
        } catch {
            print(error)
        }
        
        return reminders
    }
    
    // SAVE REMINDER
    func saveReminder(id: UUID, name: String, date: Date) {
        let reminder = Reminder(context: self.managedContext)
        reminder.date = date
        reminder.name = name
        reminder.id = id
        
        do {
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
    // REMOVE REMINDER
    func removeReminder(id: UUID) {
        let fetchRequest: NSFetchRequest<Reminder> = Reminder.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        do {
            let reminders = try self.managedContext.fetch(fetchRequest)
            for reminder in reminders {
                self.managedContext.delete(reminder)
            }
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
    // UPDATE REMINDER
    func updateReminder(id: UUID, name: String, date: Date) {
        let fetchRequest: NSFetchRequest<Reminder> = Reminder.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        do {
            let reminder = try self.managedContext.fetch(fetchRequest).first
            reminder?.date = date
            reminder?.name = name
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
}

// MARK: - NSManagedObjectContext

extension NSManagedObjectContext {
    
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
}
