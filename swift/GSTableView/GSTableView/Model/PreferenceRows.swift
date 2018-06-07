//
//  PreferenceRows.swift
//  Task One
//
//  Created by Jha, Vasudha on 08/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import Foundation

class PreferenceRows{
    
   private(set) var title: String?
   private(set) var segueId: String?
   private(set) var style: PreferenceCellStyle = .label
    
    init(data: [AnyHashable: Any]) {
        
        title = data[PreferenceConstants.title] as? String
        segueId = data[PreferenceConstants.segueId] as? String
        
        guard let row = data[PreferenceConstants.style] as? NSNumber else {
            return
        }
        style = PreferenceCellStyle(rawValue: row.intValue)!
    }
}
