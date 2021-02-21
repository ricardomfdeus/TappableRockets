//
//  RocketDetail.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 20/02/2021.
//

import SwiftUI

struct RocketDetail: View {
    let rocket: RocketItem
    
    @State var index = 0
    
    @ViewBuilder func titleAndValue(title: String, value: String, spacing: CGFloat = 0) -> some View {
        HStack(alignment: .center, spacing: spacing, content: {
            Text(title).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
            Text(value).padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10))
        })
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                if let images = rocket.imageUrls {
                    PagingView(index: $index.animation(), maxIndex: images.count - 1) {
                        ForEach(images, id: \.self) { imageUrl in
                            UrlImageView(url: imageUrl)
                        }
                    }
                    .aspectRatio(25/18, contentMode: .fill)
                    .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                }
                
                HStack(alignment: .center, spacing: 0, content: {
                    if let name = rocket.name {
                        Text(name)
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
                            .lineLimit(nil)
                    }
                    Text(rocket.active ? "Active" : "Inactive")
                        .foregroundColor(rocket.active ? .green : .gray)
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10))
                })
                
                if let successRate = rocket.successRate {
                    HStack(alignment: .center, spacing: 0, content: {
                        Text("Success Rate:")
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
                        Text("\(successRate)%")
                            .frame(width: 40, height: 40, alignment: .center)
                            .font(.caption)
                            .background(Circle()
                                            .fill(Color(rocket.badgeColor)))
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10))
                    })
                }
                
                if let country = rocket.country {
                    titleAndValue(title: "Country:", value: country)
                }
                
                if let rocketDescription = rocket.rocketDescription {
                    titleAndValue(title: "Description:", value: rocketDescription).lineLimit(nil)
                }
                
                if let firstFlight = rocket.firstFlight?.dateString() {
                    titleAndValue(title: "First flight:", value: firstFlight)
                }
                
                if let costPerLaunch = rocket.costPerLaunch {
                    titleAndValue(title: "Cost per launch:", value: costPerLaunch)
                }
                
                if let wiki = rocket.wikipedia {
                    Link("See Wikipedia", destination: URL(string: wiki)!)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                }
            })
        })
    }
}

struct RocketDetail_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetail(rocket: RocketItem(imageUrls: nil,
                                        name: "Test rocket name Test rocket name Test rocket name Test rocket name",
                                        successRate: 50,
                                        firstFlight: Date(),
                                        active: true,
                                        country: "Portugal",
                                        rocketDescription: "Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket Falcon 9 is a two-stage rocket ",
                                        costPerLaunch: "123$",
                                        wikipedia: "www.wikipedia.com",
                                        id: "123"))
    }
}
