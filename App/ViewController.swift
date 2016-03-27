//
//  ViewController.swift
//  App
//
//  Created by Shivam Kapur on 25/03/16.
//  Copyright © 2016 Shivam Kapur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var calendarView: UIView!
    @IBOutlet weak var snoozedView:CircularView!
    @IBOutlet weak var completedView:CircularView!
    @IBOutlet weak var overdueView:CircularView!
    
    @IBOutlet weak var snoozedLbl:UILabel!
    @IBOutlet weak var completedLbl:UILabel!
    @IBOutlet weak var overdueLbl:UILabel!

    
    var isMenuVisible:Bool = false 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        snoozedLbl.alpha = 0
        completedLbl.alpha = 0
        overdueLbl.alpha = 0
    
        
        snoozedLbl.text = "20%"
        completedLbl.text = "75%"
        overdueLbl.text = "5%"
        
        UIView.animateWithDuration(1) {
            self.snoozedLbl.alpha = 1
            self.completedLbl.alpha = 1
            self.overdueLbl.alpha = 1
            
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func showMenu(sender: UIButton) {
        if isMenuVisible {
            self.slideMenuController()?.closeLeft()
        }   else {
            self.slideMenuController()?.openLeft()
        }
    }

    @IBAction func calendarViewTapped(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "calshow://")!)
    }

    
}

