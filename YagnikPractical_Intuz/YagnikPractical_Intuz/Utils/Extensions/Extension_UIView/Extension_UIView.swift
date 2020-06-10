//
//  Extension_UIView.swift
//  uClinic
//
//  Created by Viral Shah on 26/04/18.
//  Copyright © 2018 Viral Shah. All rights reserved.
//

import Foundation
import UIKit


//MARK:- AIEdge
enum AIEdge:Int {
    case
    Top,
    Left,
    Bottom,
    Right,
    Top_Left,
    Top_Right,
    Bottom_Left,
    Bottom_Right,
    All,
    None
}

extension CALayer {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        mask = shape
    }
}

extension UIView {
    
    //MARK:- HEIGHT / WIDTH
    
    var width:CGFloat {
        return self.frame.size.width
    }
    var height:CGFloat {
        return self.frame.size.height
    }
    var xPos:CGFloat {
        return self.frame.origin.x
    }
    var yPos:CGFloat {
        return self.frame.origin.y
    }
    
    //MARK:- DASHED BORDER
    func drawDashedBorderAroundView() {
        let cornerRadius: CGFloat = self.frame.size.width / 2
        let borderWidth: CGFloat = 0.5
        let dashPattern1: Int = 4
        let dashPattern2: Int = 2
        let lineColor = UIColor.white
        
        //drawing
        let frame: CGRect = self.bounds
        let shapeLayer = CAShapeLayer()
        //creating a path
        let path: CGMutablePath = CGMutablePath()
        
        //drawing a border around a view
        path.move(to: CGPoint(x: CGFloat(0), y: CGFloat(frame.size.height - cornerRadius)), transform: .identity)
        path.addLine(to: CGPoint(x: CGFloat(0), y: CGFloat(cornerRadius)), transform: .identity)
        path.addArc(center: CGPoint(x: CGFloat(cornerRadius), y: CGFloat(cornerRadius)), radius: CGFloat(cornerRadius), startAngle: CGFloat.pi, endAngle: CGFloat(-Double.pi/2), clockwise: false, transform: .identity)
        path.addLine(to: CGPoint(x: CGFloat(frame.size.width - cornerRadius), y: CGFloat(0)), transform: .identity)
        path.addArc(center: CGPoint(x: CGFloat(frame.size.width - cornerRadius), y: CGFloat(cornerRadius)), radius: CGFloat(cornerRadius), startAngle: CGFloat(-Double.pi/2), endAngle: CGFloat(0), clockwise: false, transform: .identity)
        path.addLine(to: CGPoint(x: CGFloat(frame.size.width), y: CGFloat(frame.size.height - cornerRadius)), transform: .identity)
        path.addArc(center: CGPoint(x: CGFloat(frame.size.width - cornerRadius), y: CGFloat(frame.size.height - cornerRadius)), radius: CGFloat(cornerRadius), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi/2), clockwise: false, transform: .identity)
        path.addLine(to: CGPoint(x: CGFloat(cornerRadius), y: CGFloat(frame.size.height)), transform: .identity)
        path.addArc(center: CGPoint(x: CGFloat(cornerRadius), y: CGFloat(frame.size.height - cornerRadius)), radius: CGFloat(cornerRadius), startAngle: CGFloat(Double.pi/2), endAngle: CGFloat.pi, clockwise: false, transform: .identity)
        
        //path is set as the _shapeLayer object's path
        
        shapeLayer.path = path
        shapeLayer.backgroundColor = UIColor.clear.cgColor
        shapeLayer.frame = frame
        shapeLayer.masksToBounds = false
        shapeLayer.setValue(NSNumber(value: false), forKey: "isCircle")
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = borderWidth
        shapeLayer.lineDashPattern = [NSNumber(integerLiteral: dashPattern1),NSNumber(integerLiteral: dashPattern2)]
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func addDashedBorder(_ color: UIColor = UIColor.black) { 
        let yourViewBorder = CAShapeLayer()
        yourViewBorder.strokeColor = color.cgColor
        yourViewBorder.lineDashPattern = [4, 2]
        yourViewBorder.frame = self.bounds
        yourViewBorder.fillColor = nil
        yourViewBorder.path = UIBezierPath(rect: self.bounds).cgPath
        self.layer.addSublayer(yourViewBorder)
    }
    
    
    //MARK:- ROTATE
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        self.transform = self.transform.rotated(by: radians);
    }
    
    func addDashedBorder(width: CGFloat? = nil, height: CGFloat? = nil, lineWidth: CGFloat = 2, lineDashPattern:[NSNumber]? = [6,3], strokeColor: UIColor = UIColor.red, fillColor: UIColor = UIColor.clear) {
        
        
        var fWidth: CGFloat? = width
        var fHeight: CGFloat? = height
        
        if fWidth == nil {
            fWidth = self.frame.width - 8
        }
        
        if fHeight == nil {
            fHeight = self.frame.height
        }
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        
        let shapeRect = CGRect(x: 0, y: 0, width: fWidth!, height: fHeight!)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: fWidth!/2, y: fHeight!/2)
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = lineDashPattern 
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 8).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
    //MARK:- BORDER
    func applyBorderDefault() {
        self.applyBorder(color: UIColor.red, width: 1.0)
    }
    func applyBorderDefault1() {
        self.applyBorder(color: UIColor.green, width: 1.0)
    }
    func applyBorderDefault2() {
        self.applyBorder(color: UIColor.blue, width: 1.0)
    }
    func applyBorder(color:UIColor, width:CGFloat) {
        DispatchQueue.main.async {
            self.layer.borderColor = color.cgColor
            self.layer.borderWidth = width
        }
    }
    
    
    //MARK:- CIRCLE
    func applyCircle() {
        self.applyCornerRadius(radius: min(self.frame.size.height, self.frame.size.width) * 0.5)
    }
    
    //MARK:- CORNER RADIUS
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        self.layer.cornerRadius = radius
        var maskedCorners = CACornerMask()
        if corners == .topLeft {
            maskedCorners = .layerMinXMinYCorner
        } else if corners == .topRight {
            maskedCorners = .layerMaxXMinYCorner
        } else if corners == [.topLeft, .topRight] || corners == [.topRight, .topLeft] {
            maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else if corners == .bottomLeft {
            maskedCorners = .layerMinXMaxYCorner
        } else if corners == .bottomRight {
            maskedCorners = .layerMaxXMaxYCorner
        } else if corners == [.bottomLeft, .bottomRight] || corners == [.bottomRight, .bottomLeft] {
            maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
            maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        self.layer.maskedCorners = maskedCorners
    }
    
    func applyCornerRadius(radius:CGFloat) {
        DispatchQueue.main.async {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true
        }
    }
    
    func chatViewCorner(radius: CGFloat) {
        self.layer.cornerRadius = CGFloat(radius)
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func senderChatViewCorner(radius: CGFloat) {
        self.layer.cornerRadius = CGFloat(radius)
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        //        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    
    //MARK:- SHADOW
    
    func applyShadowWithColor(color:UIColor, opacity:Float, radius: CGFloat, edge:AIEdge, shadowSpace:CGFloat)    {
        var sizeOffset:CGSize = CGSize.zero
        switch edge {
        case .Top:
            sizeOffset = CGSize(width: 0, height: -shadowSpace) //CGSizeMake(0, -shadowSpace)
        case .Left:
            sizeOffset = CGSize(width: -shadowSpace, height: 0) //CGSizeMake(-shadowSpace, 0)
        case .Bottom:
            sizeOffset = CGSize(width: 0, height: shadowSpace) //CGSizeMake(0, shadowSpace)
        case .Right:
            sizeOffset = CGSize(width: shadowSpace, height: 0) //CGSizeMake(shadowSpace, 0)
            
            
        case .Top_Left:
            sizeOffset = CGSize(width: -shadowSpace, height: -shadowSpace) //CGSizeMake(-shadowSpace, -shadowSpace )
        case .Top_Right:
            sizeOffset = CGSize(width: shadowSpace, height: -shadowSpace) //CGSizeMake(shadowSpace, -shadowSpace)
        case .Bottom_Left:
            sizeOffset = CGSize(width: -shadowSpace, height: shadowSpace) //CGSizeMake(-shadowSpace, shadowSpace)
        case .Bottom_Right:
            sizeOffset = CGSize(width: shadowSpace, height: shadowSpace) //CGSizeMake(shadowSpace, shadowSpace)
            
            
        case .All:
            sizeOffset = CGSize(width: 0, height: 0) //CGSizeMake(0, 0)
        case .None:
            sizeOffset = CGSize.zero
        }
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = sizeOffset
        self.layer.shadowRadius = radius
        self.layer.cornerRadius = radius
        //        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }
    
//    func addBottomCornerRadius(_ radius: CGFloat) {
//        //        self.layer.roundCorners(corners: [.bottomLeft, .bottomRight], radius: radius)
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = radius
//        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//    }
    
    func addTopCornersRadius(_ radius: CGFloat, corners: UIRectCorner) {
        self.layer.roundCorners(corners: corners, radius: radius)
    }
    
    func addBottomCornerRadius(_ radius: CGFloat, corners: UIRectCorner) {
        self.layer.roundCorners(corners: corners, radius: radius)
    }
    
    func addBorderWithColor(color:UIColor, edge:AIEdge, thicknessOfBorder:CGFloat)    {
        
        
        DispatchQueue.main.async {
            
            var rect:CGRect = CGRect.zero
            
            switch edge {
            case .Top:
                rect = CGRect(x: 0, y: 0, width: self.width, height: thicknessOfBorder) //CGRectMake(0, 0, self.width, thicknessOfBorder);
            case .Left:
                rect = CGRect(x: 0, y: 0, width: thicknessOfBorder, height:self.width ) //CGRectMake(0, 0, thicknessOfBorder, self.height);
            case .Bottom:
                rect = CGRect(x: 0, y: self.height - thicknessOfBorder, width: self.width, height: thicknessOfBorder) //CGRectMake(0, self.height - thicknessOfBorder, self.width, thicknessOfBorder);
            case .Right:
                rect = CGRect(x: self.width-thicknessOfBorder, y: 0, width: thicknessOfBorder, height: self.height) //CGRectMake(self.width-thicknessOfBorder, 0,thicknessOfBorder, self.height);
            default:
                break
            }
            
            let layerBorder = CALayer()
            layerBorder.frame = rect
            layerBorder.backgroundColor = color.cgColor
            self.layer.addSublayer(layerBorder)
        }
    }
    
    //MARK:- ANIMATE VIBRATE
    func animateVibrate() {
        
        let duration = 0.05
        
        UIView.animate(withDuration: duration ,
                       animations: {
                        self.transform = self.transform.translatedBy(x: 5, y: 0)
        },
                       completion: { finish in
                        
                        UIView.animate(withDuration: duration ,
                                       animations: {
                                        self.transform = self.transform.translatedBy(x: -10, y: 0)
                        },
                                       completion: { finish in
                                        
                                        
                                        UIView.animate(withDuration: duration ,
                                                       animations: {
                                                        self.transform = self.transform.translatedBy(x: 10, y: 0)
                                        },
                                                       completion: { finish in
                                                        
                                                        
                                                        UIView.animate(withDuration: duration ,
                                                                       animations: {
                                                                        self.transform = self.transform.translatedBy(x: -10, y: 0)
                                                        },
                                                                       completion: { finish in
                                                                        
                                                                        UIView.animate(withDuration: duration){
                                                                            self.transform = CGAffineTransform.identity
                                                                        }
                                                        })
                                        })
                        })
        })
    }
}

extension Collection {
    func toJsonString() -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
            guard let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) else {
                print("Can't create string with data.")
                return "{}"
            }
            return jsonString
        } catch let parseError {
            print("json serialization error: \(parseError)")
            return "{}"
        }
    }
}

    

