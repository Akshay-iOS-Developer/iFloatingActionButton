//
//  FloatingItemCell.swift
//  iFloatingButton
//
//  Created by Akshay Agrawal on 27/06/17.
//  Copyright © 2017 Akshay Agrawal. All rights reserved.
//

import UIKit

class FloatingItemCell: UITableViewCell {

    @IBOutlet weak var itemImgView: UIImageView!
    @IBOutlet weak var itemDescriptionLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.itemImgView.layer.cornerRadius = self.itemImgView.frame.size.height / 2
        self.selectionStyle  = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initCell(_ item:FloatingItem){
        self.itemDescriptionLbl.text = item.title
        self.itemDescriptionLbl.textColor = item.titleTextColor
        self.itemImgView.image = item.image
        self.itemImgView.backgroundColor = item.imageBackGroundColor
        self.itemDescriptionLbl.font = item.titleFont
    }
    
}
