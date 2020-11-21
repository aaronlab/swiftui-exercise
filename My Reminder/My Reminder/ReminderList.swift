//
//  ContentView.swift
//  My Reminder
//
//  Created by Aaron Lee on 2020-11-21.
//

import SwiftUI

struct ReminderList: View {
    // MARK: - PROPERTIES
    
    @ObservedObject private var reminderListVM = ReminderListViewModel()
    @State private var addNewPresented = false
    
    // MARK: - INIT
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                ZStack(alignment: .bottomTrailing) {
                    
                    ReminderHeader().padding(.top, 16)
                    Button(action: { self.addNewPresented.toggle() }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                    }.padding([.trailing, .bottom], 20)
                    .sheet(isPresented: $addNewPresented) {
                        // ADD NEW
                        Text("ADD")
                    }
                } //: ZSTACK
                List {
                    ForEach(self.reminderListVM.reminders.indices, id: \.self) { index in
                        ZStack {
                            
                            ReminderCell(reminderVM: self.reminderListVM.reminders[index])
                                .defaultShadow(radius: 10)
                            
                            NavigationLink(destination:
                                            Text("Update")
                                            .navigationTitle("")
                                            .navigationBarHidden(true)
                            ) {
                                EmptyView()
                            } //: NAVIGATION LINK
                            .buttonStyle(PlainButtonStyle())
                        } //: ZSTACK
                    } //: FOR EACH
                    .onDelete(perform: delete(at:))
                } //: LIST
                .onAppear {
                    self.reload()
                }
            } //: VSTACK
            .background(Color.gray.edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
        } //: NAVIGATION
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            self.reminderListVM.removeReminder(at: index)
        }
        self.reload()
    }
    
    private func reload() {
        self.reminderListVM.fetchReminders()
    }
}

struct ReminderHeader: View {
    
    var body: some View {
        VStack {
            Text("Reminder")
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Rectangle().fill(Color.clear))
        } //: VSTACK
        .edgesIgnoringSafeArea(.all)
    }
    
}
