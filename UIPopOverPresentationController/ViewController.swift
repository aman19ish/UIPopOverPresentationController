//
//  ViewController.swift
//  UIPopOverPresentationController
//
//  Created by Aman Gupta on 19/01/17.
//  Copyright © 2017 Aman. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPopoverPresentationControllerDelegate
{
  
  var itemPopVC = PopOverViewC()
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "item", style: .plain, target: self, action: #selector(rightItemClick))
    let array = ["green","yellow","blue","orange"]
    itemPopVC.arrayListPopover = array
    NotificationCenter.default.addObserver(self, selector: #selector(self.tableDidSelected), name: NSNotification.Name(rawValue: "click"), object: nil)
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func rightItemClick()
  {
    self.itemPopVC.modalPresentationStyle = .popover
    self.itemPopVC.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
    self.itemPopVC.popoverPresentationController?.permittedArrowDirections = .unknown
    self.itemPopVC.popoverPresentationController?.delegate = self
//    self.itemPopVC.popoverPresentationController?.backgroundColor = UIColor.red
//    self.itemPopVC.popoverPresentationController?.popoverLayoutMargins = UIEdgeInsets.init(top: 50.0, left: 100.0, bottom: 0.0, right: 0.0)
    self.present(self.itemPopVC, animated: true, completion: { _ in })
    
  }
  
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
  
}

