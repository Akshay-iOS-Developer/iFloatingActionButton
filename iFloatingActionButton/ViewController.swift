//
//  ViewController.swift
//  iFloatingButton
//
//  Created by Akshay Agrawal on 22/06/17.
//  Copyright © 2017 Akshay Agrawal. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var floatingControl:FloatingControl?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addFloatingButton(_ sender: Any) {
        self.floatingControl = FloatingControl.initFloatingControl(X: self.view.frame.size.width-280, Y: self.view.frame.size.height-80)
        self.floatingControl?.animation = .Delayed
        self.floatingControl?.addItem(title: "First Item", image: UIImage(named: "ic_item1")!) {
            print("Item1 clicked")
        }
        self.floatingControl?.addItem(title: "Second Item", image: UIImage(named: "ic_item2")!) {
            print("Item2 clicked")
            
        }
        let floatingItem = FloatingItem()
        floatingItem.title = "Third"
        floatingItem.image = UIImage(named: "ic_item3")!
        floatingItem.imageBackGroundColor = UIColor.init(colorLiteralRed: 102/255.0, green: 102/255.0, blue: 255/255.0, alpha: 1)
        self.floatingControl?.addItem(item: floatingItem) {
            print("Item3 clicked")
            
        }
        self.view.addSubview(self.floatingControl!)
    }
   
}

