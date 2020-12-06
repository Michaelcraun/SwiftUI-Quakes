//
//  QuakeDetails.swift
//  Quakes
//
//  Created by Michael Craun on 5/8/20.
//  Copyright © 2020 Craunic Productions. All rights reserved.
//

import SwiftUI

struct QuakeDetails: View {
    var data: Quake.Features
    var body: some View {
        ZStack(alignment: .top) {
            MapView(data: data)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 6) {
                Text(String(data.properties.mag))
                    .font(.largeTitle)
                
                Text(data.properties.place)
            }.clipShape(Rectangle())
                .frame(height: nil)
                .padding(.all, 20)
                .background(Color.green)
                .shadow(radius: 9)
                .cornerRadius(9)
                .opacity(0.8)
        }
    }
}

//struct QuakeDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        QuakeDetails()
//    }
//}
