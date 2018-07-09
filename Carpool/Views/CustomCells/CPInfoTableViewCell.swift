//
//  CPInfoTableViewCell.swift
//  Carpool
//
//  Created by Shimaa Magdi on 7/8/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import UIKit
import MapKit

/**
 *  CPInfoTableViewCell table view cell displays the car details.
 */
class CPInfoTableViewCell: UITableViewCell {
    
    static let ID = "CPInfoTableViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var containerView: CPCustomView!
    @IBOutlet weak var statusLineView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var engineTypeNFuel: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    /**
     Configure Cell With Model displays details for each placemark model.
     - Parameter placemarkModel: CPPlacemarkViewModel contains placemark details.
     */
    func configureCell(withPlacemark placemarkModel: CPPlacemarkViewModel){
        nameLbl.text = placemarkModel.title
        engineTypeNFuel.text = "Engine Type: " + placemarkModel.engineType + ", Fuel: " + String(placemarkModel.fuel)
        addressLbl.text = placemarkModel.address
        addReginWithAnnotation(coordinate: placemarkModel.coordinate)
        switch placemarkModel.status {
        case .BothGood:
            statusLineView.backgroundColor = UIColor.green
        case .oneUnacceptable:
            statusLineView.backgroundColor = UIColor.yellow
        default:
            statusLineView.backgroundColor = UIColor.red
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addCornerRadius()
        containerView.dropCardShadow()
    }
    
    /**
     Adding annotation displays car location on cell map.
     - Parameter coordinate: CLLocationCoordinate2D for the car.
     */
    func addReginWithAnnotation(coordinate: CLLocationCoordinate2D) {
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 100, 100)
        mapView.setRegion(region, animated: true)
        
        let point = MKPointAnnotation()
        point.coordinate = coordinate
        self.mapView.addAnnotation(point)
    }
    
}
