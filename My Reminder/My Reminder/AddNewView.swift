//
//  AddNewView.swift
//  My Reminder
//
//  Created by Aaron Lee on 2020-11-22.
//

import SwiftUI

final class AddNewData: ObservableObject {
    @Published var name: String = ""
    @Published var date: Date = Date()
}

struct AddNewView: View {
    // MARK: - PROPERTIES
    
    @Binding var addNewPresented: Bool
    @ObservedObject private var newData = AddNewData()
    private let viewModel = AddNewViewModel()
    
    // MARK: - BODY

    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    
                    Text(viewModel.titleText)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                } //: HSTACK
                .padding([.bottom, .leading], 16)
                
                TextField("Enter Name", text: $newData.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(16)
                    .foregroundColor(.black)
                
                VStack {
                    
                    Text("Date")
                        .bold()
                        .padding(16)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(Rectangle().fill(Color.red))
                    
                    DatePicker(selection: $newData.date, in: Date()..., displayedComponents: .date) {
                        Text("")
                    } //: PICKER
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                } //: VSTACK
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                .background(RoundedRectangle(cornerRadius: 20.0).fill(Color.white).defaultShadow(radius: 5))
                .padding(16)
                
                HStack(spacing: 30) {
                    Button(action: { self.addNewPresented.toggle() }) {
                        Text("Cancel")
                            .bold()
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.red))
                    
                    Button(action: { self.addNew() }) {
                        Text("Save")
                            .bold()
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.purple))
                } //: HSTACK
                .foregroundColor(.white)
                .padding(16)
                .padding(.top, 50)
            } //: VSTACK
        }
        .onTapGesture {
            DismissKeyboardHelper.dismiss()
        }
    }
    
    private func addNew() {
        let reminder = ReminderViewModel(id: UUID(), name: newData.name, date: newData.date)
        viewModel.saveReminder(with: reminder)
        self.addNewPresented.toggle()
    }
}
