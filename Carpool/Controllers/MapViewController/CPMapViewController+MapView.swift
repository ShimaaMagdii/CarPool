//
//  CPMapViewController+MapView.swift
//  Carpool
//
//  Created by Shimaa Magdi on 7/8/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import UIKit
import MapKit

extension CPMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let annotations = mapView.annotations
        let selectedAnnotation = view.annotation
        
        annotations.forEach { annotation in
            if annotation is MKUserLocation == false {
                mapView.view(for: annotation)?.isHidden = annotation.title! != selectedAnnotation!.title!
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        mapView.annotations.forEach { annotation in
            mapView.view(for: annotation)?.isHidden = false
        }
    }
}
