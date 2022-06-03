//
//  CustomTableViewCell.swift
//  TwitterSampleApp
//
//  Created by 荒川響 on 2022/06/01.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var Menu: UIButton!
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var Content: UILabel!
    @IBOutlet weak var Icon: UILabel!
    @IBOutlet weak var Name: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
