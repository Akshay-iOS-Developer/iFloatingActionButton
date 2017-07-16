//
//  FloatingItem.swift
//  iFloatingButton
//
//  Created by Akshay Agrawal on 28/06/17.
//  Copyright © 2017 Akshay Agrawal. All rights reserved.
//

import UIKit

public class FloatingItem: NSObject {

    public var title:String
    public var titleTextColor:UIColor
    public var image:UIImage
    public var imageBackGroundColor:UIColor
    public var titleFont:UIFont
    internal var itemClickHandler:(() -> Void)? = nil
   
    public override init() {
        title = ""
        titleTextColor = UIColor.black
        image = UIImage()
        imageBackGroundColor = UIColor.init(colorLiteralRed: 255/255.0, green: 102/255.0, blue: 178/255.0, alpha: 1)
        titleFont = UIFont.systemFont(ofSize: 15)
    }
}
