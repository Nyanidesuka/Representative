//
//  RepTableViewCell.swift
//  Representative
//
//  Created by Haley Jones on 5/16/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class RepTableViewCell: UITableViewCell {

    @IBOutlet weak var repNameLabel: UILabel!
    @IBOutlet weak var repPartyLabel: UILabel!
    @IBOutlet weak var repWebsiteLabel: UILabel!
    @IBOutlet weak var repPhoneLabel: UILabel!
    @IBOutlet weak var repDistrictLabel: UILabel!
    
    func updateViews(with rep: Representative){
        repNameLabel.text = rep.name
        repPartyLabel.text = rep.party
        repWebsiteLabel.text = rep.link
        repDistrictLabel.text = rep.district
        repPhoneLabel.text = rep.phone
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
