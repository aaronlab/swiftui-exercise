//
//  ReminderListViewModel.swift
//  My Reminder
//
//  Created by Aaron Lee on 2020-11-21.
//

import Foundation

final class ReminderListViewModel: ObservableObject {
    
    @Published var reminders = [ReminderViewModel]()
    
    func fetchReminders() {
        self.reminders = DataManager.shared.getReminders().map(ReminderViewModel.init)
    }
    
    func removeReminder(at index: Int) {
        let reminder = reminders[index]
        DataManager.shared.removeReminder(id: reminder.id)
    }
    
}
