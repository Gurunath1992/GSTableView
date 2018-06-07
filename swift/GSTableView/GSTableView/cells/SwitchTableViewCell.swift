//
//  SwitchTableViewCell.swift
//  Task One
//
//  Created by Jha, Vasudha on 08/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import UIKit

class SwitchTableViewCell: BaseTableViewCell {

    @IBOutlet weak var `switch`: UISwitch!
    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        super.configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(data: PreferenceRows) {
        label.text = data.title
    }

}
