//
//  BaseTableViewCell.swift
//  Task One
//
//  Created by Jha, Vasudha on 08/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(){
        
    }

}
