import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        contentLabel.layer.masksToBounds = true
        contentLabel.layer.cornerRadius = contentLabel.frame.size.height / 20
    }
}
