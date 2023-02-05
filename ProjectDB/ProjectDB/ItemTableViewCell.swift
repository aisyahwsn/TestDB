//
//  ItemTableViewCell.swift
//  ProjectDB
//
//  Created by Aisyah on 05/02/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
