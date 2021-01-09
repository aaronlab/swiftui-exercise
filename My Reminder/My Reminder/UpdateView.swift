//
//  UpdateView.swift
//  My Reminder
//
//  Created by Aaron Lee on 2020-11-22.
//

import SwiftUI

final class UpdateData: ObservableObject {
    @Published var name: String = ""
    @Published var date: Date = Date()
    @Published var id: UUID = UUID()
}

struct UpdateView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var data = UpdateData()
    private let viewModel = UpdateViewModel()
    
    init(reminderVM: ReminderViewModel) {
        data.id = reminderVM.id
        data.name = reminderVM.name
        data.date = reminderVM.date
    }
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    
                    Text("Update Reminder")
                        .font(.title)
                    Spacer()
                } //: HSTACK
                .padding([.leading, .bottom], 16)
                
                TextField("Enter name", text: $data.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(16)
                    .foregroundColor(.black)
                
                VStack {
                    
                    Text("Date")
                        .bold()
                        .padding(16)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(Rectangle().fill(Color.red))
                    
                    DatePicker(selection: $data.date, in: Date()..., displayedComponents: .date) {
                        Text("")
                    } //: PICKER
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                } //: VSTACK
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                .background(RoundedRectangle(cornerRadius: 20.0).fill(Color.white).defaultShadow(radius: 5))
                .padding(16)
                
                HStack(spacing: 30) {
                    Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                        Text("Cancel")
                            .bold()
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.red))
                    
                    Button(action: { self.update() }) {
                        Text("Save")
                            .bold()
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.purple))
                } //: HSTACK
                .foregroundColor(.white)
                .padding(16)
                .padding(.top, 50)
            } //: VSTACK
        } //: ZSTACK
        .onTapGesture {
            DismissKeyboardHelper.dismiss()
        }
    }
    
    private func update() {
        let reminder = ReminderViewModel(id: data.id, name: data.name, date: data.date)
        viewModel.updateReminder(with: reminder)
        self.presentationMode.wrappedValue.dismiss()
    }
    
}
