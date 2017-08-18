## UIPopOverPresentationController ##
UIPopOverViewController in swift is writen in swift 3.1 and Use the xcode Version 8.3.2.
For use this import the PopOverViewController folder into your project.
For using this file create the instance of PopOverViewC class and inherit the `UIPopoverPresentationControllerDelegate` :
```swift
  var itemPopVC = PopOverViewC()
```

Add below line of code in your Tapable button function for set the properties of UIPopOverViewController, change the properties 
```swift
self.itemPopVC.modalPresentationStyle = .popover
self.itemPopVC.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
self.itemPopVC.popoverPresentationController?.permittedArrowDirections = .unknown
self.itemPopVC.popoverPresentationController?.delegate = self
self.itemPopVC.popoverPresentationController?.backgroundColor = UIColor.red
self.itemPopVC.popoverPresentationController?.popoverLayoutMargins = UIEdgeInsets.init(top: 50.0, left: 100.0, bottom: 0.0, right: 0.0)
self.present(self.itemPopVC, animated: true, completion: { _ in })
```

`self.itemPopVC.popoverPresentationController?.barButtonItem` in this pass the tapable bar button, and there is `sourceRect` also in which
we pass the rect of any button.

For Get the didSelectCell call back add the notification and add these functions:

```swift
func tableDidSelected(_ notification: Notification)
  {
    var indexpath: IndexPath? = (notification.object as? IndexPath)
    self.itemPopVC.dismiss(animated: true, completion: { _ in })
  }
  
  
  func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool
  {
    return true
  }
  
  func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle
  {
    return UIModalPresentationStyle.none
  }
```

## Example ##
![Example](https://github.com/aman19ish/UIPopOverPresentationController/blob/master/ExampleImages/Screen%20Shot%202017-08-17%20at%206.22.21%20PM.png)
