//
//  NewsTableViewCell.swift
//  News
//
//  Created by Caner Çağrı on 5.04.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var headLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
