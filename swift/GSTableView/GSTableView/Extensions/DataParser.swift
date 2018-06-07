//
//  DataParser.swift
//  Task One
//
//  Created by Jha, Vasudha on 17/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import Foundation

internal extension PreferenceDataParser{
    
    static func parseData() throws -> [AnyHashable : Any]{
        
        let url = Bundle.main.url(forResource: PreferenceConstants.plistName, withExtension: PreferenceConstants.plistType)!
        let data = try! Data(contentsOf: url)
        let dictionary = try! PropertyListSerialization.propertyList(from: data, format: nil) as! [AnyHashable : Any]
        return dictionary
    }
}
