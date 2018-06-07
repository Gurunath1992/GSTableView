//
//  PreferencesViewController.swift
//  Task One
//
//  Created by Jha, Vasudha on 13/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class PreferencesViewController: UIViewController  {
    
    @IBOutlet var preferencePresenter: PreferenceDataPresenter!
    @IBOutlet weak var tableView: UITableView!
    
    static func loadFromStoryboard() -> PreferencesViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier:"PreferencesViewController" ) as! PreferencesViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        
        preferencePresenter.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
       self.tableView.estimatedRowHeight = 44
    }
    
    @IBAction func tappedTermsOfUse(_ sender: Any) {
        
    }
    
    @IBAction func tappedPrivacyPolicy(_ sender: Any) {
        
    }
    
}

extension PreferencesViewController: PreferencePresenterDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         let segueId = preferencePresenter.getSegueIdForIndex(index: indexPath)
        if segueId == "custom"{
            let mail = try! RecommendDataParser.init()
            sendMail(recipients:[] , subject: mail.subject, message:mail.body)
        }
        else{
             self.navigationController?.pushViewController(loadController(segueId), animated: true)
        }
        
    }
    
    func loadController(_ segueId: String)-> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier:segueId)
    }
    
    func reloadData(){
        tableView.reloadData()
    }
}



