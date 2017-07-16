//
//  FloatingControl.swift
//  iFloatingButton
//
//  Created by Akshay Agrawal on 22/06/17.
//  Copyright © 2017 Akshay Agrawal. All rights reserved.
//

import UIKit

public enum AnimationType{
    case Normal
    case Delayed
    case Jerk
    case Fade
}

  public class FloatingControl: UIView {
    
    internal var floatingItemsArray:[FloatingItem] = []
    internal var viewHeight:CGFloat = 0
    internal var viewInitYCord:CGFloat = 0
    internal var viewInitXCord:CGFloat = 0
    internal var subDelegate:TableViewSubDelegate = TableViewSubDelegate()
    public var animation:AnimationType = .Delayed
    
    @IBOutlet weak var floatingButton: FloatingButton!
    
    @IBOutlet weak var itemTableView: UITableView!
    
    public class func initFloatingControl(X vX:CGFloat, Y vY:CGFloat) -> FloatingControl{
        let bundle:Bundle = Bundle.main
        let floatingControl:FloatingControl = bundle.loadNibNamed("FloatingControl", owner: self, options: nil)?.last as! FloatingControl
        floatingControl.viewHeight = 50
        floatingControl.viewInitYCord = vY
        floatingControl.viewInitXCord = vX
        floatingControl.frame = CGRect(x: vX, y: vY, width: 250, height: 50)
        floatingControl.floatingButton.layer.cornerRadius = floatingControl.floatingButton.frame.size.height/2
        floatingControl.itemTableView.register(UINib.init(nibName: "FloatingItemCell", bundle: bundle), forCellReuseIdentifier: "FloatingItemCell")
        floatingControl.itemTableView.delegate = floatingControl.subDelegate
        floatingControl.itemTableView.dataSource = floatingControl.subDelegate
        return floatingControl
    }
    
    @IBAction func floatingButtonClicked(_ sender: Any) {
        switch self.animation {
        case .Normal:
            if self.floatingButton.buttonState == .Normal{
                self.floatingButton.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI/4.0))
                self.floatingButton.buttonState = .Rotated
                self.frame = CGRect(x: self.frame.origin.x, y: (self.viewInitYCord - self.viewHeight + 50), width: self.frame.size.width, height: self.viewHeight)
                self.layoutIfNeeded()
            }
            else{
                self.floatingButton.transform = CGAffineTransform(rotationAngle:0)
                self.floatingButton.buttonState = .Normal
                self.frame = CGRect(x: self.frame.origin.x, y: self.viewInitYCord, width: self.frame.size.width, height: 50)
                self.layoutIfNeeded()
            }
            break
        case .Delayed:
            if self.floatingButton.buttonState == .Normal{
                UIView.animate(withDuration: 0.3, animations: {
                    self.floatingButton.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI/4.0))
                    self.floatingButton.buttonState = .Rotated
                    self.frame = CGRect(x: self.frame.origin.x, y: (self.viewInitYCord - self.viewHeight + 50), width: self.frame.size.width, height: self.viewHeight)
                    self.layoutIfNeeded()
                })
            }
            else{
                UIView.animate(withDuration: 0.3, animations: {[unowned self] in
                    self.floatingButton.transform = CGAffineTransform(rotationAngle:0)
                    self.floatingButton.buttonState = .Normal
                    self.frame = CGRect(x: self.frame.origin.x, y: self.viewInitYCord, width: self.frame.size.width, height: 50)
                    self.layoutIfNeeded()
                })
            }
            break
        
        case .Fade:
            if self.floatingButton.buttonState == .Normal{
                self.itemTableView.alpha = 0
                UIView.animate(withDuration: 0.5, animations: {
                    self.floatingButton.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI/4.0))
                    self.floatingButton.buttonState = .Rotated
                    self.frame = CGRect(x: self.frame.origin.x, y: (self.viewInitYCord - self.viewHeight + 50), width: self.frame.size.width, height: self.viewHeight)
                    self.layoutIfNeeded()
                    self.itemTableView.alpha = 1
            
                })
            }
            else{
                UIView.animate(withDuration: 1, animations: {[unowned self] in
                    self.floatingButton.transform = CGAffineTransform(rotationAngle:0)
                    self.floatingButton.buttonState = .Normal
                    self.frame = CGRect(x: self.frame.origin.x, y: self.viewInitYCord, width: self.frame.size.width, height: 50)
                    self.layoutIfNeeded()
                    self.itemTableView.alpha = 0
                })
            }
            break
        case .Jerk:
            if self.floatingButton.buttonState == .Normal{
                self.itemTableView.alpha = 0
                UIView.animate(withDuration: 0.5, animations: {
                    self.floatingButton.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI/4.0))
                    self.floatingButton.buttonState = .Rotated
                    self.frame = CGRect(x: self.frame.origin.x, y: (self.viewInitYCord - self.viewHeight + 50), width: self.frame.size.width, height: self.viewHeight)
                    self.layoutIfNeeded()
                    self.itemTableView.alpha = 1
                    
                })
            }
            else{
                UIView.animate(withDuration: 1, animations: {[unowned self] in
                    self.floatingButton.transform = CGAffineTransform(rotationAngle:0)
                    self.floatingButton.buttonState = .Normal
                    self.frame = CGRect(x: self.frame.origin.x, y: self.viewInitYCord, width: self.frame.size.width, height: 50)
                    self.layoutIfNeeded()
                    self.itemTableView.alpha = 0
                })
            }
            break
        }
    }
    
    public func addItem(title:String, image:UIImage, clickHandler:@escaping () -> Void){
        let floatingItem:FloatingItem = FloatingItem()
        floatingItem.title = title
        floatingItem.image = image
        floatingItem.itemClickHandler = clickHandler
        self.floatingItemsArray.append(floatingItem)
        self.subDelegate.floatingItemsArray = self.floatingItemsArray
        self.viewHeight += 50
        self.itemTableView.reloadData()
    }
    
    public func addItem(item:FloatingItem, clickHandler:@escaping () -> Void){
        item.itemClickHandler = clickHandler
        self.floatingItemsArray.append(item)
        self.subDelegate.floatingItemsArray = self.floatingItemsArray
        self.viewHeight += 50
        self.itemTableView.reloadData()
    }
    
     
}
