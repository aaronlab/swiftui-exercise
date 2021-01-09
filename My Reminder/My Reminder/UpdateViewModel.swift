//
//  UpdateViewModel.swift
//  My Reminder
//
//  Created by Aaron Lee on 2020-11-22.
//

import Foundation

final class UpdateViewModel {
    
    func updateReminder(with reminder: ReminderViewModel) {
        DataManager.shared.updateReminder(id: reminder.id, name: reminder.name, date: reminder.date)
    }
    
}
