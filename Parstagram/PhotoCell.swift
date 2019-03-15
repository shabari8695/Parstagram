//
//  PhotoCell.swift
//  Parstagram
//
//  Created by Shabari Girish Ganapathy on 3/14/19.
//  Copyright © 2019 Shabari Girish Ganapathy. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var commentlabel: UILabel!
    @IBOutlet weak var photoview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
