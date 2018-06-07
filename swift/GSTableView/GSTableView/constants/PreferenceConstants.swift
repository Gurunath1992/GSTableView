//
//  PreferenceConstants.swift
//  Task One
//
//  Created by Jha, Vasudha on 08/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import Foundation


public struct Cell {

    static let switchIdentifier = "SwitchTableViewCell"
    static let editableIdentifier = "EditableTableViewCell"
    static let labelIdentifier = "LabelTableViewCell"
    static let navigationIdentifier = "NavigationTableViewCell"
    static let sectionIdentifier = "TableViewSectionHeader"
}

public struct PreferenceConstants {
    
    //property list keys
    static let plistName = "preference"
    static let plistType = "plist"
    
    //keys for components in the plist file
    static let headerNeeded = "isHeaderNeeded"
    static let headerExpandable = "isHeaderExpandable"
    static let headerTitle = "headerTitle"
    static let sectionCell = "cells"
    static let title = "title"
    static let segueId = "segueId"
    static let style = "style"
  
    
    
    //recommendation mail
    static let recommend = "Recommend"
    static let subject = "subject"
    static let body = "body"
    static let privacyUrl = "url"
    
    //failure message
}

//types of rows that a cell might have
enum PreferenceCellStyle:Int {
    case label = 0
    case toggle
    case editable
    case navigation
}


