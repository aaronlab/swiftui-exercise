//
//  ContentView.swift
//  CalendarExample
//
//  Created by Aaron Lee on 2021-01-06.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.calendar) var calendar
    
    private var year: DateInterval {
        return self.calendar.dateInterval(of: .year, for: Date())!
    }
    
    var body: some View {
        GeometryReader { geo in
            CalendarView(interval: year) { date in
                
                Text("11")
                    .hidden()
                    .padding(8)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .padding(.vertical, 8)
                    .overlay(
                        Text(String(self.calendar.component(.day, from: date)))
                    )
                    .frame(width: geo.size.width / 8)
            } //: C
        } //: G
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
