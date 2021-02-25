//
//  AsyncImageView.swift
//  NewsTest
//
//  Created by Aaron Lee on 2021-02-25.
//

import SwiftUI

struct AsyncImageView: View {
    
    @ObservedObject private var imageLoader: ImageLoader
    @State private var image: UIImage = UIImage(named: "placeholder")!
    
    init(with url: String) {
        self.imageLoader = ImageLoader(urlString: url)
    }
    
    var body: some View {
        
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
        
    }
    
}
