//
//  PreferencesSectionHeader.swift
//  Task One
//
//  Created by Jha, Vasudha on 13/11/17.
//  Copyright © 2017 Jha, Vasudha. All rights reserved.
//

import UIKit

 typealias sectionHeaderTapAction = (PreferencesSectionHeader?) -> Void

class PreferencesSectionHeader: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var accessoryIndicator: UIImageView!
    @IBOutlet weak var selectionIndicator: UIView!

    var tapActionBlock: sectionHeaderTapAction?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withData data: PreferenceSections, handler:sectionHeaderTapAction?) {
        titleLabel.text = data.headerTitle
        tapActionBlock = handler
        
        let singleFingerTap = UITapGestureRecognizer(target: self, action: #selector(self.didTapHeader))
        singleFingerTap.numberOfTapsRequired = 1
        singleFingerTap.numberOfTouchesRequired = 1
        self.addGestureRecognizer(singleFingerTap)
        
        guard let indicator = selectionIndicator else {
            return
        }
        indicator.isHidden = !data.isExpanded
        
        if data.isExpanded {
            //accessoryIndicator.image = #imageLiteral(resourceName: "collapse")
        }
        else {
            //accessoryIndicator.image = #imageLiteral(resourceName: "expand")
        }
   }
    
    @objc func didTapHeader() {
        tapActionBlock?(self)
    }
}
