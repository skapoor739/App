//
//  CircularView.swift
//  App
//
//  Created by Shivam Kapur on 27/03/16.
//  Copyright © 2016 Shivam Kapur. All rights reserved.
//

import UIKit

@IBDesignable
class CircularView: UIView {

    let circle1 = CAShapeLayer()
    let circle2 = CAShapeLayer()
    
    var anim:CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
    let strokeWidth:CGFloat = 2.0

    
    @IBInspectable var chosenColor:UIColor = UIColor.greenColor() {
        didSet {
            circle2.strokeColor = chosenColor.CGColor
        }
    }
    
    @IBInspectable var percentComplete:CGFloat = 10 {
        didSet {
            
                circle2.strokeEnd = percentComplete / 100
                anim.toValue = percentComplete / 100
        }
    }
    
    

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        circle1.path = UIBezierPath(arcCenter: CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds)), radius: self.bounds.width / 2, startAngle:CGFloat(-M_PI/2), endAngle: CGFloat(3 * M_PI / 2), clockwise: true).CGPath
        circle1.frame = self.layer.bounds
        self.layer.mask = circle1
        circle1.strokeColor = UIColor.grayColor().CGColor
        circle1.fillColor = UIColor.clearColor().CGColor
 
        circle2.path = UIBezierPath(arcCenter: CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds)), radius: self.bounds.width / 2, startAngle:CGFloat(-M_PI/2), endAngle: CGFloat(3 * M_PI / 2), clockwise: true).CGPath
        circle2.frame = self.layer.bounds
        circle2.strokeStart = 0
        circle2.strokeEnd = percentComplete
        circle2.strokeColor = chosenColor.CGColor
        circle2.fillColor = UIColor.clearColor().CGColor
        
        circle1.lineWidth = strokeWidth
        circle2.lineWidth = strokeWidth
    
        self.layer.addSublayer(circle1)
        self.layer.addSublayer(circle2)
        
        anim.fromValue = 0
        anim.toValue = percentComplete
        anim.duration = 3.0
        anim.repeatCount = 1
        circle2.addAnimation(anim, forKey: "strokeEnd")

    }

}
