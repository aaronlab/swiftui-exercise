//
//  ReminderViewModel.swift
//  My Reminder
//
//  Created by Aaron Lee on 2020-11-21.
//

import Foundation

final class ReminderViewModel {
    
    var id: UUID
    var name: String
    var date: Date
    
    var monthFormatter: DateFormatter = {
        let formattter = DateFormatter()
        formattter.dateStyle = .short
        formattter.dateFormat = "MMM"
        return formattter
    }()
    
    var dayFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "dd"
        return formatter
    }()
    
    var remainingDays: Int {
        var nextRemindDayComponents = Calendar.current.dateComponents([.day, .month], from: date)
        let todayComponent = Calendar.current.dateComponents([.year], from: Date())
        nextRemindDayComponents.year = todayComponent.year!
        
        var nextRemindDay = Calendar.current.date(from: nextRemindDayComponents)
        
        if Date() > nextRemindDay! {
            nextRemindDay = Calendar.current.date(byAdding: .year, value: 1, to: nextRemindDay!)
        }
        
        return Calendar.current.dateComponents([.day], from: Date(), to: nextRemindDay!).day ?? 0
    }
    
    var turningYear: Int {
        return (Calendar.current.dateComponents([.year], from: date, to: Date()).year ?? 0) + 1
    }
    
    var monthString: String {
        return monthFormatter.string(from: date)
    }
    
    var dayString: String {
        return dayFormatter.string(from: date)
    }
    
    init(id: UUID, name: String, date: Date) {
        self.id = id
        self.name = name
        self.date = date
    }
    
    init(reminder: Reminder) {
        self.id = reminder.id ?? UUID()
        self.name = reminder.name ?? ""
        self.date = reminder.date ?? Date()
    }
    
}
