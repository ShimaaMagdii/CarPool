//
//  CPPlacemarkManager.swift
//  Carpool
//
//  Created by EAS on 7/11/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import Foundation

/**
 *     @struct private CPPlacemarkManager
 *  This struct is singelton that has array of placeMarks of type CPPlacemarkViewModel
 */

internal struct CPPlacemarkManager {
    static let shared = CPPlacemarkManager()
    /**
     *  @param (read-only) placeMarks a Array of CPPlacemarkViewModel model
     */
    public private(set) var placeMarks: [CPPlacemarkViewModel]?
    
    init() {
        placeMarks =  CPPlacemarkParser.parsePlacemarkers()
    }
}
