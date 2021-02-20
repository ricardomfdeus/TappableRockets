//
//  RocketDetail.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 20/02/2021.
//

import SwiftUI

struct RocketDetail: View {
    var rocket: RocketItem
    
    var body: some View {
        
            VStack {
                Text("Name")
                
                HStack(alignment: .center, spacing: 10, content: {
                    Text("Success Rate")
                    
                    Text("50%")
                        .frame(width: 40, height: 40, alignment: .center)
                        .font(.caption)
                        .background(Circle()
                                        .fill(Color.red))
                })
                
                Text("Active")
                    .foregroundColor(.green)
                
                Text("Country")
                
                Text("Description")
                
                Text("first flight")
                
                Text("cost")
                
                Link("See Wikipedia", destination: URL(string: "www.wikipedia.com")!)
            }
            .navigationTitle("Detalhe")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.yellow)
        
    }
}

#if DEBUG
struct RocketDetail_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetail(rocket: RocketItem(imageUrl: nil,
                                        name: "Test rocket name",
                                        successRate: 50,
                                        firstFlight: Date(),
                                        active: true,
                                        country: "Portugal",
                                        rocketDescription: "This is a test rocket",
                                        costPerLaunch: "123$",
                                        wikipedia: "www.wikipedia.com",
                                        id: "123"))
    }
}
#endif
