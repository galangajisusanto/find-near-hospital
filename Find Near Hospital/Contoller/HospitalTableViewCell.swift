//
//  HospitalTableViewCell.swift
//  Find Near Hospital
//
//  Created by Galang Aji Susanto on 13/07/21.
//

import UIKit

class HospitalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var adress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
