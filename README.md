# iFloatingActionButton

This control is similar to the android floating button. Floating button is an amazing control to add quickly accessible options. Since there is no native control like this in iOS, so this control can be used to add this functionality.
## Preview
<img src="https://github.com/kciter/Floaty/raw/master/Images/preview.gif" width='187' alt="Preview gif">

## Requirements
* iOS 8.0+
* Swift 3.0
* Xcode 8

## Installation
### CocoaPods
```ruby
use_frameworks!
pod "iFloatingActionButton"
```
### Manually
To install manually the iFloatingActionButton in an app, just drag the `Classes/` folder into your project.

## Usage
### Dependent on the UIViewController.


```swift
 let floatingControl = FloatingControl.initFloatingControl(X: 100, Y:100)
        floatingControl?.animation = .Delayed
        floatingControl?.addItem(title: "First Item", image: UIImage(named: "ic_item1")!) {
            print("Item1 clicked")
        }
        self.floatingControl?.addItem(title: "Second Item", image: UIImage(named: "ic_item2")!) {
            print("Item2 clicked")
            
        }
        let floatingItem = FloatingItem()
        floatingItem.title = "Third"
        floatingItem.image = UIImage(named: "ic_item3")!
        floatingItem.imageBackGroundColor = UIColor.init(colorLiteralRed: 102/255.0, green: 102/255.0, blue: 255/255.0, alpha: 1)
        floatingControl?.addItem(item: floatingItem) {
            print("Item3 clicked")
            
        }
        self.view.addSubview(self.floatingControl!)

```
<img src="https://github.com/kciter/Floaty/raw/master/Images/dependent_on_uiwindow.gif" width='187' alt="Dependent on the UIWindow">


## ToDo
* [ ] Labels to come at the right hand side of the + button.

## License
The MIT License (MIT)

Copyright (c) 2017 Akshay Agrawal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
