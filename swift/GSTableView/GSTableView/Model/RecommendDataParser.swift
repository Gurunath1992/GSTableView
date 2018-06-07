//
//  MailComposerParser.swift
//  Task One
//
//  Created by Jha, Vasudha on 14/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import Foundation

class RecommendDataParser{


    private(set) var  subject:String?
    private(set) var  body:String?
    private(set) var  privacyUrl:String?

    init() throws {
        
            let preferenceDictionary = try! PreferenceDataParser.parseData()
            guard  let recommendDictionary = preferenceDictionary[PreferenceConstants.recommend] as? [String : String] else {
                      return
            }
             subject = recommendDictionary[PreferenceConstants.subject]
             body = recommendDictionary[PreferenceConstants.body]
             privacyUrl = recommendDictionary[PreferenceConstants.privacyUrl]
        }
}
