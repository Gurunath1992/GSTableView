//
//  PreferenceSections.swift
//  Task One
//
//  Created by Jha, Vasudha on 08/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import Foundation


internal class PreferenceSections{
    
    var isExpanded = false
    private(set) var isHeaderNeeded = false
    private(set) var isHeaderExpandable = false
    private(set) var headerTitle: String?
    private(set) var rows = [PreferenceRows]()
    private(set) var numberOfRows = 0
    
    init(data: [AnyHashable : Any]) {

          isHeaderNeeded = (data[PreferenceConstants.headerNeeded] as? Bool)!
          isHeaderExpandable = (data[PreferenceConstants.headerExpandable] as? Bool)!
          headerTitle = data[PreferenceConstants.headerTitle] as? String
          numberOfRows = ((data[PreferenceConstants.sectionCell] as? [AnyObject])?.count)!

        if let multiData = data[PreferenceConstants.sectionCell]  as? [[AnyHashable:Any]] {
            for singleData in multiData {
                 let row = PreferenceRows(data: singleData)
                 rows.append(row)
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        if( isExpanded == true || isHeaderNeeded == false ) {
            return numberOfRows
        }
        return 0
    }
    
}
