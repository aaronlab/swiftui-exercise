//
//  HikingDetail.swift
//  Hiking
//
//  Created by Aaron Lee on 2020-10-12.
//

import SwiftUI

struct HikingDetail: View {

    let hike: Hike
    @State private var zoomed: Bool = false

    var body: some View {
        VStack {
            Image(hike.imageURL)
                .resizable()
                .aspectRatio(contentMode: self.zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        self.zoomed.toggle()
                    }
            }

            Text(hike.name)
                .font(.title)
            Text("\(String(format: "%2.f", hike.miles)) miles")
        }.navigationTitle(hike.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HikingDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikingDetail(hike: Hike(name: "Toronto", imageURL: "toronto", miles: 6))
    }
}
