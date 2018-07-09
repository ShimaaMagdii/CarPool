//
//  CPPlacemarkViewModel.swift
//  Carpool
//
//  Created by Shimaa Magdi on 7/8/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import Foundation
import MapKit

/**
 *     @class CPPlacemarkViewModel
 *  This class is used for annotations model.
 */
class CPPlacemarkViewModel: CPBaseViewModel, MKAnnotation {
    /**
     *  @param (read-only) AcceptanceStatus a enum that indicates the status of the car's exterior and interior
     */
    enum AcceptanceStatus {
        case BothGood
        case BothUnacceptable
        case oneUnacceptable
    }
    /**
     *  @param (read-only) address a String value that has address of car
     */
    public private(set) var address: String
    /**
     *  @param (read-only)  coordinate a CLLocationCoordinate2D value
     *
     *  Discussion:
     *    A structure that contains a geographical coordinate.
     *
     *  Fields:
     *    latitude:
     *      The latitude in degrees.
     *    longitude:
     *      The longitude in degrees.
     */
    public private(set) var coordinate: CLLocationCoordinate2D
    /**
     *  @param (read-only)  engineType a String value that has engine Type of car
     */
    public private(set) var engineType: String
    /**
     *  @param (read-only)  status a AcceptanceStatus value that show status of exterior and interior
     */
    public private(set) var status: AcceptanceStatus
    /**
     *  @param (read-only)  title a String value that has title of car and will used for annotation
     */
    public private(set) var title: String?
    /**
     *  @param (read-only)  vin a String value that has vin of car
     */
    public private(set) var vin: String
    /**
     *  @param (read-only)  fuel a Int value that has fuel size of car
     */
    public private(set) var fuel: Int
    
    /**
     *     @brief CPPlacemarkViewModel initialization
     */
    public init(address: String? ,coordinate: CLLocationCoordinate2D?, engineType: String?, exterior: String?, interior: String?, title: String?, vin: String?, fuel: Int?) {
        self.address = address ?? ""
        self.coordinate = coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
        self.engineType = engineType ?? ""
        if let exteriorSrt = exterior, let interiorStr = interior {
            if exteriorSrt == "GOOD" && interiorStr == "GOOD" {
                self.status = .BothGood
            } else if exteriorSrt == "UNACCEPTABLE" && interiorStr == "UNACCEPTABLE" {
                self.status = .BothUnacceptable
            }else{
                self.status = .oneUnacceptable
            }
        }else{
            self.status = .BothUnacceptable
        }
        self.title = title ?? ""
        self.vin = vin ?? ""
        self.fuel = fuel ?? 0
        super.init()
    }
}
