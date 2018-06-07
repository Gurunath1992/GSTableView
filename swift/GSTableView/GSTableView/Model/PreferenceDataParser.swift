//
//  PreferenceDataParser.swift
//  Task One
//
//  Created by Jha, Vasudha on 08/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import Foundation

class PreferenceDataParser{
    
    static func preferenceDataParsing() throws -> [PreferenceSections]  {
        
        var sectionData = [PreferenceSections]()
        
        do {
            
            let preferenceDictionary = try PreferenceDataParser.parseData()
            if  let tableViewDictionary = preferenceDictionary[PreferenceConstants.plistName] as?[[AnyHashable : Any]]{
                for tableViewSection in tableViewDictionary{
                    let section = PreferenceSections.init(data: tableViewSection)
                    sectionData.append(section)
                }
            }
        }
        catch {
            
        }
        return sectionData
    }
}






