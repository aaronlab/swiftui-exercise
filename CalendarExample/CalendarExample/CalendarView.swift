//
//  CalendarView.swift
//  CalendarExample
//
//  Created by Aaron Lee on 2021-01-06.
//

import SwiftUI

struct CalendarView<DateView>: View where DateView: View {
    
    @Environment(\.calendar) var calendar
    
    let interval: DateInterval
    let content: (Date) -> DateView
    let days = Day.allCases
    
    init(interval: DateInterval, @ViewBuilder content: @escaping (Date) -> DateView) {
        self.interval = interval
        self.content = content
    }
    
    private var months: [Date] {
        self.calendar.generateDates(
            inside: self.interval,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }
    
    var body: some View {
        GeometryReader { geo in
            
            TabView {
                
                ForEach(self.months, id: \.self) { month in
                    
                    VStack {
                        
                        Spacer()
                            .frame(height: 32)
                        
                        // MMMM yyyy
                        Text(self.getMonth(with: month))
                            .font(.title)
                            .fontWeight(.bold)
                        
                        // DAYS
                        HStack(spacing: 4) {
                            
                            ForEach(self.days, id: \.self) { day in
                                
                                Text(day.rawValue)
                                    .foregroundColor(self.getForegroundColor(with: day))
                                    .frame(width: geo.size.width / 8)
                            }
                        } //: H
                        .padding(.top, 32)
                        
                        
                        MonthView(month: month, content: self.content)
                            .padding(.top, 16)
                        
                        Spacer(minLength: 0)
                    } //: V
                }
            } //: T
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        } //: G
    }
    
    private func getMonth(with date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
    
    private func getForegroundColor(with day: Day) -> Color {
        switch day {
        case .sat:
            return .blue
        case .sun:
            return .red
        default:
            return .primary
        }
    }
    
    enum Day: String, CaseIterable {
        case mon = "Mon"
        case tue = "Tue"
        case wed = "Wed"
        case thu = "Thu"
        case fri = "Fri"
        case sat = "Sat"
        case sun = "Sun"
    }
}

extension Calendar {
    func generateDates(inside interval: DateInterval, matching components: DateComponents) -> [Date] {
        var dates: [Date] = []
        dates.append(interval.start)
        
        enumerateDates(startingAfter: interval.start, matching: components, matchingPolicy: .nextTime ) { date, _, stop in
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }
        
        return dates
    }
}
