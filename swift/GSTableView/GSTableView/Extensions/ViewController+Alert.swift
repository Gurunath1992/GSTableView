//
//  Alert.swift
//  Task One
//
//  Created by Jha, Vasudha on 16/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    open  func alert(title:String? , message:String?, style: UIAlertControllerStyle)-> Void {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
