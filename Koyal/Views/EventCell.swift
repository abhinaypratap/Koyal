//
//  EventCell.swift
//  Koyal
//
//  Created by Abhinay Pratap on 30/07/22.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentLabel.layer.masksToBounds = true
        contentLabel.layer.cornerRadius = contentLabel.frame.size.height / 5
    }
    
}
