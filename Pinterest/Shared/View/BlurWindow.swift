//
//  BlurWindow.swift
//  Pinterest (iOS)
//
//  Created by Aaron Lee on 2020-12-08.
//

import SwiftUI

struct BlurWindow: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) { }
}

struct BlurWindow_Previews: PreviewProvider {
    static var previews: some View {
        BlurWindow()
    }
}
