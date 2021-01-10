//
//  DatePicker.swift
//  DatePickerViewExample
//
//  Created by Aaron Lee on 2021/01/10.
//

import SwiftUI
import MDatePickerView

struct DatePicker: UIViewRepresentable {
    
    @Binding var dateText: String
    
    init(dateText: Binding<String>) {
        self._dateText = dateText
    }
    
    func makeUIView(context: UIViewRepresentableContext<DatePicker>) -> MDatePickerView {
        let dateView = MDatePickerView()
        dateView.Color = .gray
        dateView.delegate = context.coordinator
        dateView.from = 1908
        dateView.to = 2100
        return dateView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        return DatePicker.Coordinator(dateText: self.$dateText)
    }
    
    class Coordinator: NSObject, MDatePickerViewDelegate {
        
        @Binding var dateText: String
        
        init(dateText: Binding<String>) {
            self._dateText = dateText
        }
        
        func mdatePickerView(selectDate: Date) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy - MM - dd"
            let date = formatter.string(from: selectDate)
            self.dateText = date
        }
        
    }
}
