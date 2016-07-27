//
//  CustomGraphics.swift
//  CustomSearchBar(Final)
//
//  Created by Jeffrey Ip on 2016-07-27.
//  Copyright © 2016 RT7. All rights reserved.
//

import UIKit

class CustomGraphics {
    
    func drawNavArrow(color: CGColor) -> UIImage {
        
        let targetSize = CGSizeMake(22, 22)
        let targetRect = CGRectMake(0, 0, targetSize.width, targetSize.height)
        
        //declare context in which to draw
        UIGraphicsBeginImageContextWithOptions(targetSize, true, 0.0)
        
        let context = UIGraphicsGetCurrentContext()
        
        //fill background color
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillRect(context, targetRect)
        
        //drawing
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, targetSize.width, 0.0)
        CGContextAddLineToPoint(context, (1/2)*targetSize.width, targetSize.height)
        CGContextAddLineToPoint(context, (1/2)*targetSize.width, (1/2)*targetSize.height)
        CGContextAddLineToPoint(context, 0.0, (1/2)*targetSize.height)
        CGContextClosePath(context)
        
        CGContextSetFillColorWithColor(context, color)
        CGContextFillPath(context)
        
        //save drawing to image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        //end image context
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func drawXButton() -> UIImage {
        let lineWidth: CGFloat = 1.5
        let targetSize = CGSizeMake(20, 20)
        let targetRect = CGRectMake(0, 0, targetSize.width, targetSize.height)
        
        let circleRect = CGRectMake(
            lineWidth / 2,
            lineWidth / 2,
            targetRect.width - lineWidth,
            targetRect.height - lineWidth)
        
        //declare context in which to draw
        UIGraphicsBeginImageContextWithOptions(targetSize, true, 0.0)
        
        let context = UIGraphicsGetCurrentContext()
        
        //fill background color
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillRect(context, targetRect)
        
        CGContextAddEllipseInRect(context, circleRect)
        CGContextSetFillColorWithColor(context, UIColor.darkGrayColor().CGColor)
        CGContextFillEllipseInRect(context, circleRect)
        
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, (1/3)*targetRect.width, (1/3)*targetRect.height)
        CGContextAddLineToPoint(context, (2/3)*targetRect.width, (2/3)*targetRect.height)
        CGContextMoveToPoint(context, (1/3)*targetRect.width, (2/3)*targetRect.height)
        CGContextAddLineToPoint(context, (2/3)*targetRect.width, (1/3)*targetRect.height)
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextStrokePath(context)
        
        //save drawing to image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        //end image context
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func drawMagnifyGlass() -> UIImage {
        
        let lineWidth: CGFloat = 6.0
        let targetSize = CGSizeMake(100, 100)
        let targetRect = CGRectMake(0, 0, targetSize.width, targetSize.height)
        
        let circleCenterX = (5/12)*targetRect.width
        let circleCenterY = (5/12)*targetRect.height
        let circleRadius = (1/4)*targetRect.width
        
        let stemStartX = circleCenterX + circleRadius * CGFloat(cosd(45.0))
        let stemStartY = circleCenterY + circleRadius * CGFloat(sind(45.0))
        
        //declare context in which to draw
        UIGraphicsBeginImageContextWithOptions(targetSize, true, 0.0)
        
        let context = UIGraphicsGetCurrentContext()
        
        //fill background color
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillRect(context, targetRect)
        
        CGContextBeginPath(context)
        CGContextAddArc(context, circleCenterX, circleCenterY, circleRadius, 0.0, CGFloat(2 * M_PI), 1) //2pi radians = 360 deg
        CGContextMoveToPoint(context, stemStartX, stemStartY)
        CGContextAddLineToPoint(context, (5/6)*targetRect.width, (5/6)*targetRect.height)
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextStrokePath(context)
        
        //save drawing to image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        //end image context
        UIGraphicsEndImageContext()
        
        return image
    }
    
    //helper functions alowwing sin and cos to take degree parameters, and not radians
    func sind(degrees: Double) -> Double {
        return sin(degrees * M_PI / 180.0)
    }
    
    func cosd(degrees: Double) -> Double {
        return cos(degrees * M_PI / 180.0)
    }
}
