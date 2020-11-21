//
//  ReminderCell.swift
//  My Reminder
//
//  Created by Aaron Lee on 2020-11-21.
//

import SwiftUI

struct ReminderCell: View {
    
    var reminderVM: ReminderViewModel
    @State private var updatePresented = false
    
    var body: some View {
        HStack {
            
            VStack {
                
                // MONTH
                Text(reminderVM.monthString)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 60, height: 20)
                    .background(Rectangle().fill(Color.red))
                
                // DATE
                Text(reminderVM.dayString)
                    .bold()
                    .frame(height: 40)
            } //: VSTACK
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
            .defaultShadow(radius: 5)
            
            // NAME
            Text(reminderVM.name)
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 16)
            
            Spacer()
            
            // Turning, Days, in Days
            VStack {
                Text("Turning")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text("\(reminderVM.turningYear)")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .defaultShadow(radius: 4)
                
                Text("In \(reminderVM.remainingDays) days")
                    .font(.caption)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } //: VSTACK
        } //: HSTACK
        .padding(16)
        .background(Color.black.opacity(0.16))
        .cornerRadius(10)
        .defaultShadow(radius: 10)
    }
}
