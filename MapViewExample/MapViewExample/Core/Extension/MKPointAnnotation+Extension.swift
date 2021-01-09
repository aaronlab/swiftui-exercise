//
//  MKPointAnnotation+Extension.swift
//  MapViewExample
//
//  Created by Aaron Lee on 2021/01/09.
//

import Foundation
import MapKit

extension MKPointAnnotation {
    
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "과천"
        annotation.subtitle = "어딘가..."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.438801, longitude: 126.999867)
        return annotation
    }
    
}
