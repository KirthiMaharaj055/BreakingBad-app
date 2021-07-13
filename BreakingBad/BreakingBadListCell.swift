//
//  BreakingBadListCell.swift
//  BreakingBad
//
//  Created by IACD-Air-7 on 2021/07/04.
//

import UIKit

class BreakingBadListCell: UITableViewCell {

    @IBOutlet weak var imageViews: UIImageView!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
