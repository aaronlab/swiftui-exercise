//
//  MonthView.swift
//  CalendarExample
//
//  Created by Aaron Lee on 2021-01-06.
//

import SwiftUI

struct MonthView<DateView>: View where DateView: View {
    
    @Environment(\.calendar) var calendar
    
    let month: Date
    let content: (Date) -> DateView
    
    init(month: Date, @ViewBuilder content: @escaping (Date) -> DateView) {
        self.month = month
        self.content = content
    }
    
    private var weeks: [Date] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: month) else { return [] }
        return calendar.generateDates(
            inside: monthInterval,
            matching: DateComponents(hour: 0, minute: 0, second: 0, weekday: 1)
        )
    }
    
    var body: some View {
        VStack {
            ForEach(weeks, id: \.self) { week in
                WeekView(week: week, content: self.content)
            }
        }
    }
}
