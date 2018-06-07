//
//  LabelTableViewCell.swift
//  Task One
//
//  Created by Jha, Vasudha on 08/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import UIKit

class LabelTableViewCell: BaseTableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageNavigator: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        super.configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(withData data: PreferenceRows) {
        super.configure()
        title.text = data.title
    }
}
