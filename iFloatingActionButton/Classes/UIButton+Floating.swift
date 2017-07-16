//
//  UIButton+Floating.swift
//  iFloatingButton
//
//  Created by Akshay Agrawal on 22/06/17.
//  Copyright © 2017 Akshay Agrawal. All rights reserved.
//

import Foundation
import UIKit

enum ButtonState{
    case Normal
    case Rotated
}

class FloatingButton:UIButton{
    var buttonState:ButtonState = .Normal
    
}
