//
//  EventsTableViewCell.swift
//  ListOfEvents
//
//  Created by Admin on 23/03/2018.
//  Copyright © 2018 Zubair Ghori. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var averageReview: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var chefImage: UIImageView!
    @IBOutlet weak var chefName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //round the images
        self.chefImage.layer.cornerRadius = self.chefImage.frame.size.width/2
        self.chefImage.layer.masksToBounds=true
        self.chefImage.clipsToBounds=true
    }
}
