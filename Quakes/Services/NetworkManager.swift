//
//  NetworkManager.swift
//  Quakes
//
//  Created by Michael Craun on 5/8/20.
//  Copyright © 2020 Craunic Productions. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var data = Quake(features: [])
    
    init() {
        let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson")!
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let list = try! JSONDecoder().decode(Quake.self, from: data)
            DispatchQueue.main.async {
                self.data = list
                print(self.data)
            }
        }.resume()
    }
}
