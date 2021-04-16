//
//  ContactTableViewCell.swift
//  FirstiOS2021
//
//  Created by Ahmed Qazzaz on 27/03/2021.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    var delegate : ContactTableViewCellDelegate?
    var indexPath : IndexPath!
    @IBOutlet weak var username : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func chatNowAction(_ sender : UIButton){
        delegate?.chatNowActionClicked(indexPath)
    }

}

protocol ContactTableViewCellDelegate : NSObjectProtocol {
    func chatNowActionClicked(_ index : IndexPath)    
}
