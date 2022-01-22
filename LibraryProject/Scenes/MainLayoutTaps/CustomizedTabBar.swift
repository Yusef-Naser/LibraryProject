//
//  CustomizedTabBar.swift
//  LibraryProject
//
//  Created by Khaled Elshamy on 21/01/2022.
//


import UIKit

@IBDesignable
class CustomizedTabBar: UITabBar {
    
    var selectedIndex:Int = 1
    var centerWidth: CGFloat?
    
    private var shapeLayer: CALayer?
    
    private func addShape() {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = UIColor.white.cgColor
        // uncomment below if wants to add a line
//        shapeLayer.strokeColor = UIColor.lightGray.cgColor
//        shapeLayer.lineWidth = 1.0
        
        //The below 4 lines are for shadow above the bar. you can skip them if you do not want a shadow
        shapeLayer.shadowOffset = CGSize(width:0, height:0)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.lightGray.cgColor
        shapeLayer.shadowOpacity = 0.3

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    func createPath() -> CGPath {
        let height: CGFloat = 35.0
        let path = UIBezierPath()
        
        var centerWidth:CGFloat?
        
        if let width = self.centerWidth {
            centerWidth = width
        }else {
            let width = (self.frame.width / 3)
            centerWidth = ( width * CGFloat(2)) - ( width / 2)
        }
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth! - height * 2), y: 0))
        
        path.addCurve(to: CGPoint(x: centerWidth!, y: height),
        controlPoint1: CGPoint(x: (centerWidth! - 30), y: 0), controlPoint2: CGPoint(x: centerWidth! - 35, y: height))

        path.addCurve(to: CGPoint(x: (centerWidth! + height * 2), y: 0),
        controlPoint1: CGPoint(x: centerWidth! + 35, y: height), controlPoint2: CGPoint(x: (centerWidth! + 30), y: 0))

        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        for member in subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            guard let result = member.hitTest(subPoint, with: event) else { continue }
            return result
        }
        return nil
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let tabBarSafeAreaHeight = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 75 + tabBarSafeAreaHeight!

        return sizeThatFits
    }
}
