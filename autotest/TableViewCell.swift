//
//  TableViewCell.swift
//  autotest
//
//  Created by nakrlove on 2023/01/03.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userContentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("MyTableViewCell - awakeFromNib() called")
        userProfileImage.layer.cornerRadius = userProfileImage.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
