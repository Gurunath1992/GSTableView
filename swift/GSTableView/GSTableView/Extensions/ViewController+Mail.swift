//
//  Mail.swift
//  Task One
//
//  Created by Jha, Vasudha on 14/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

extension UIViewController: MFMailComposeViewControllerDelegate {
    
    func sendMail(recipients: Array<String>, subject: String?, message: String?) {
        
        if MFMailComposeViewController.canSendMail(){
            
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            mailComposer.modalPresentationStyle = UIModalPresentationStyle.formSheet
            
            if subject != nil {
                mailComposer.setSubject(subject!)
            }
            
            if message != nil {
                mailComposer.setMessageBody(message!, isHTML: true)
            }
            
            mailComposer.setToRecipients(recipients)
            self.present(mailComposer, animated: true, completion: nil)
        }
        else{
            self.alert(title: "ll", message: "ll", style: UIAlertControllerStyle.alert)
        }
    }
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        self.dismiss(animated: true, completion: nil)
    }
}

