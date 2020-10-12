//
//  HikingDetail.swift
//  Hiking
//
//  Created by Aaron Lee on 2020-10-12.
//

import SwiftUI

struct HikingDetail: View {

    let hike: Hike

    var body: some View {
        VStack {
            Image(hike.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text(hike.name)
                .font(.title)
            Text("\(String(format: "%2.f", hike.miles)) miles")
        }
    }
}

struct HikingDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikingDetail(hike: Hike(name: "Hiking2", imageURL: "something2", miles: 6.8))
    }
}
