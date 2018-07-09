//
//  Utils.swift
//  Carpool
//
//  Created by Shimaa Magdi on 7/8/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import Foundation

class Utils {
    
    static func readJsonData(fromFile fileName: String) -> [String : Any]? {
        var jsonResult: [String:Any]?
        do {
            if let file = Bundle.main.url(forResource: fileName, withExtension: "json"){
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    jsonResult =  object
                } else if let object = json as? [Any] {
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        return jsonResult
    }
}

