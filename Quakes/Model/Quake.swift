//
//  Quake.swift
//  Quakes
//
//  Created by Michael Craun on 5/8/20.
//  Copyright © 2020 Craunic Productions. All rights reserved.
//

import Foundation

struct Quake: Decodable {
    var features: [Features]
    
    struct Features: Decodable, Hashable {
        var properties: Properties
        var geometry: Geometry
    }
    
    struct Geometry: Decodable, Hashable {
        var type: String
        var coordinates: [Double]
    }
    
    struct Properties: Decodable, Hashable {
        var mag: Double
        var place: String
        var time: Double
        var detail: String
        var title: String
    }
}
