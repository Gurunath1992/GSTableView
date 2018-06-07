//
//  PreferenceDataManager.swift
//  Task One
//
//  Created by Jha, Vasudha on 10/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import Foundation
import UIKit

protocol  PreferencePresenterDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    func reloadData()
}

class PreferenceDataPresenter:NSObject {
    
    fileprivate var data:[PreferenceSections]?
    var numberOfSections: Int?
    var numberOfRows: Int?
    var delegate :PreferencePresenterDelegate?
    
    override init() {
        
        do {
            data =  try PreferenceDataParser.preferenceDataParsing()
        }
        catch  {
            
        }
    }
    
    func handleSingleTap(recognizer: UITapGestureRecognizer){
        (recognizer.view as? PreferencesSectionHeader)?.didTapHeader()
    }
    
    
    
    func configureCell(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell{
        
        var identifier = Cell.labelIdentifier
        if let element = data {
            let data =  element[indexPath.section].rows[indexPath.row]
            
            
            
            switch(data.style){
            case .toggle:
                identifier = Cell.switchIdentifier
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier , for: indexPath) as!SwitchTableViewCell
                cell.configureWith(data: data)
                return cell
                
            case .navigation:
                identifier = Cell.navigationIdentifier
                
            default:
                break
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier , for: indexPath) as!LabelTableViewCell
        cell.configure(withData: (data?[indexPath.section].rows[indexPath.row])!)
        return cell
    }
}


extension PreferenceDataPresenter: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (data?[section].isHeaderNeeded)!  {
            return 44
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard  let sectionData = data?[section] else {
            return nil
        }
        
        if (sectionData.isHeaderNeeded){
            let header = tableView.dequeueReusableCell(withIdentifier: Cell.sectionIdentifier) as! PreferencesSectionHeader
            header.configure(withData: sectionData, handler: { (preferencesSectionHeader) in
                sectionData.isExpanded = !sectionData.isExpanded
                self.delegate?.reloadData()
            })
            return header
        }
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (data?.count)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data?[section].numberOfRowsInSection())!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureCell(indexPath: indexPath, tableView: tableView)
    }
}

extension PreferenceDataPresenter:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.delegate?.tableView(tableView, didSelectRowAt: indexPath)
 }
    
    func getSegueIdForIndex( index : IndexPath) -> String{
        
        if let tableData =  data {
            let sectionData = tableData[index.section] as PreferenceSections
             let rowData =  (sectionData ).rows[index.row] as! PreferenceRows
            return rowData.segueId!
        }
        else {
            return ""
        }
    }
}

