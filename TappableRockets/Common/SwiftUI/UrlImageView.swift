//
//  UrlImageView.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 21/02/2021.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var imageLoader: ObservableImageLoader
    
    @State var image: UIImage = UIImage()
    
    init(url: String) {
        imageLoader = ObservableImageLoader(urlString: url)
    }
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .onReceive(imageLoader.didChange) { image in
                self.image = image
            }
    }
}
