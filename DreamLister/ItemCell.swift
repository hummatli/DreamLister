//
//  ItemCell.swift
//  DreamLister
//
//  Created by Settar Hummetli on 7/20/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var imgThumb: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDetails: UILabel!

    func configureCell(item: Item) {
    
        lblTitle.text = item.title
        lblPrice.text = "$\(item.price)"
        lblDetails.text = item.details
        
        imgThumb.image = item.toImage?.image as? UIImage
        
    }
    

}
