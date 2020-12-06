//
//  ContentView.swift
//  Quakes
//
//  Created by Michael Craun on 5/8/20.
//  Copyright © 2020 Craunic Productions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.data.features, id: \.properties) { data in
                NavigationLink(destination: QuakeDetails(data: data)) {
                    CellRow(data: data)
                }.navigationBarTitle("Quakes")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
