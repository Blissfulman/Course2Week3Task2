//
//  PhotoTableViewCell.swift
//  Course2Week3Task2
//
//  Created by User on 25.06.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttonInfo: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonInfoPressed(_ sender: UIButton) {
        print("Accessory selected")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        
    }
    func fillingCell(_ cell: Photo) {
        picture.image = cell.image
        label.text = cell.name
    }

}
