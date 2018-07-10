//
//  CPMapViewController.swift
//  Carpool
//
//  Created by Shimaa Magdi on 7/8/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import UIKit
import MapKit

/**
 *     @class CPMapViewController
 *  This class is second view controller that map of cars annotations
 */

class CPMapViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: variables
    var locationManager : CLLocationManager?
    
    // Array of Placemarks
    fileprivate var dataArray : [CPPlacemarkViewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeLocationManager()
        configureMapView()
        loadData()
    }
    
    private func loadData() {
        DispatchQueue.global(qos: .default).async {
            if let placemarks = CPPlacemarkManager.shared.placeMarks {
                self.dataArray = placemarks
                DispatchQueue.main.async {
                    self.addAnnotations()
                }
            }
        }
    }
    
    
    func initializeLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestAlwaysAuthorization()
        locationManager?.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.startUpdatingLocation()
        }
    }
    
    fileprivate func configureMapView() {
        mapView.showsCompass = true
        mapView.showsTraffic = true
        mapView.userTrackingMode = .follow
        mapView.delegate = self
    }
    
    func addAnnotations() {
        dataArray!.forEach { placemark in
            mapView.addAnnotation(placemark)
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        let identifier = "CustomAnnotation"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = false
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    static func create () -> CPMapViewController {
        return UIStoryboard(name: StoryboardIdentifier.MainStoryboardIdentifier, bundle: Bundle.main).instantiateViewController(withIdentifier: StoryboardIdentifier.MapVCIdentifier) as! CPMapViewController
    }
}
