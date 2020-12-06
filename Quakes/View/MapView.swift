//
//  MapView.swift
//  Quakes
//
//  Created by Michael Craun on 5/8/20.
//  Copyright © 2020 Craunic Productions. All rights reserved.
//

import UIKit
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var data: Quake.Features
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinates = CLLocationCoordinate2D(latitude: data.geometry.coordinates[1], longitude: data.geometry.coordinates[0])
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        uiView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = data.properties.place
        annotation.subtitle = "Magnitude: \(data.properties.mag)"
        uiView.addAnnotation(annotation)
    }
}
