//
//  CPPlacemarkParser.swift
//  Carpool
//
//  Created by Shimaa Magdi on 7/8/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import CoreLocation
import ObjectMapper

/**
 *     @struct CPPlacemarkParser
 *  This struct is used for parsing landmark array
 */
internal struct CPPlacemarkParser {
    
    internal static func parsePlacemarkers() -> [CPPlacemarkViewModel]? {
        var parsedArray : [CPPlacemarkViewModel] = []
        
        if let json = Utils.readJsonData(fromFile: "locations") {
            
            if let placemarkDataModel :CPPlacemarkDataModel = Mapper<CPPlacemarkDataModel>().map(JSON: json) {
                if let placemarskList = placemarkDataModel.placemarks {
                    for placemark in placemarskList {
                        let placemarkViewModel = mapPlacemarkDataModelToPlacemarkViewModel(placemark: placemark)
                        parsedArray.append(placemarkViewModel)
                    }
                }
            }
        }
        return parsedArray
    }
    
    internal static func mapPlacemarkDataModelToPlacemarkViewModel(placemark: CPPlacemark) -> CPPlacemarkViewModel {
        var coordinates: CLLocationCoordinate2D? =  CLLocationCoordinate2D()
        if let corrdinatesArray = placemark.coordinates {
            coordinates = CLLocationCoordinate2D(latitude: corrdinatesArray[1], longitude: corrdinatesArray[0])
        }
        return CPPlacemarkViewModel(address: placemark.address, coordinate: coordinates, engineType: placemark.engineType, exterior: placemark.exterior, interior: placemark.interior, title: placemark.name, vin: placemark.vin, fuel: placemark.fuel)
    }
    
}
