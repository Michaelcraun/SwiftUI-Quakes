//
//  CellRow.swift
//  Quakes
//
//  Created by Michael Craun on 5/8/20.
//  Copyright © 2020 Craunic Productions. All rights reserved.
//

import SwiftUI

struct CellRow: View {
    var data: Quake.Features
    var body: some View {
        HStack(alignment: .center, spacing: 9) {
            VStack(alignment: .leading) {
                VStack {
                    Text(String(data.properties.mag))
                        .bold()
                        .foregroundColor(.white)
                        .font(.headline)
                }.frame(width: 100, height: 100)
                    .background(Color.green)
            }.clipShape(Circle())
                .overlay(Circle()
                    .stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 10)
            
            VStack {
                Text(data.properties.place)
                    .foregroundColor(.gray)
                    .bold()
                Text("Time: \(timeConverter(timeStamp: data.properties.time))")
                    .italic()
                    .foregroundColor(.orange)
                    .font(.subheadline)
                    .padding(.all, 2)
            }
        }
    }
    
    func timeConverter(timeStamp: Double) -> String {
        let unixTimeStamp = timeStamp / 1000
        let date = Date(timeIntervalSince1970: unixTimeStamp)
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.locale = .current
        formatter.dateFormat = "dd MMM YY, hh:mm a"
        return formatter.string(from: date)
    }
}

//struct CellRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CellRow()
//    }
//}
