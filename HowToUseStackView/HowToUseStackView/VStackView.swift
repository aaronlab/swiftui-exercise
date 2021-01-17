//
// Created by Aaron Lee on 2021/01/17.
//

import SwiftUI

struct VStackView: View {

    var body: some View {

        VStack(alignment: .leading) {

            Rectangle()
                    .frame(width: 200, height: 20)

            Text("1")

            Text("2")

            Text("3")
        } //: V
    }

}
