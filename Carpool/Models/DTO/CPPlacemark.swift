//
//  CPPlacemark.swift
//  Carpool
//
//  Created by Shimaa Magdi on 7/8/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import Foundation
import ObjectMapper

class CPPlacemarkDataModel: CPBaseMappable {
    
    private(set) var placemarks : [CPPlacemark]?
    
    override func mapping(map: Map)
    {
        placemarks <- map[MappingKey.Placemarks]
    }
    
}

class CPPlacemark: CPBaseMappable {
    
    private(set) var address : String?
    private(set) var engineType : String?
    private(set) var exterior : String?
    private(set) var fuel : Int?
    private(set) var interior : String?
    private(set) var name : String?
    private(set) var vin : String?
    private(set) var coordinates : [ Double]?
    
    override func mapping(map: Map)
    {
        address <- map[MappingKey.Address]
        engineType <- map[MappingKey.EngineType]
        exterior <- map[MappingKey.Exterior]
        fuel <- map[MappingKey.Fuel]
        interior <- map[MappingKey.Interior]
        name <- map[MappingKey.Name]
        vin <- map[MappingKey.Vin]
        coordinates <- map[MappingKey.Coordinates]
    }
}

fileprivate struct MappingKey {
    static let Placemarks: String = "placemarks"
    static let Address: String = "address"
    static let EngineType: String = "engineType"
    static let Exterior: String = "exterior"
    static let Fuel: String = "fuel"
    static let Interior: String = "interior"
    static let Name: String = "name"
    static let Vin: String = "vin"
    static let Coordinates: String = "coordinates"
}
