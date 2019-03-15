//
//  CommentCell.swift
//  Parstagram
//
//  Created by Shabari Girish Ganapathy on 3/14/19.
//  Copyright © 2019 Shabari Girish Ganapathy. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
