//
//  PlacemarkManager.swift
//  Carpool
//
//  Created by Shimaa Magdi on 7/8/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import Foundation

/**
 *     @struct private PlacemarkManager
 *  This struct is singelton that has array of placeMarks of type CPPlacemarkViewModel
 */

internal struct PlacemarkManager {
    static let shared = PlacemarkManager()
    /**
     *  @param (read-only) placeMarks a Array of CPPlacemarkViewModel model
     */
    public private(set) var placeMarks: [CPPlacemarkViewModel]?
    
    init() {
        placeMarks =  CPPlacemarkParser.parsePlacemarkers()
    }
}
