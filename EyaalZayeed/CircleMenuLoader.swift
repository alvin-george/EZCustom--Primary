//
//  CircleMenuLoader.swift
//  CircleMenu


import Foundation
import UIKit

internal class CircleMenuLoader: UIView {
    
    var appUIColor_First:UIColor = UIColor(rgb: 0x3F51B5)
    
    // MARK: properties
    var circle: CAShapeLayer?
    
    // MARK: life cycle
    internal init(radius: CGFloat, strokeWidth: CGFloat, platform: UIView, color: UIColor?) {
        super.init(frame: CGRect(x: 0, y: 0, width: radius, height: radius))
        
        platform.addSubview(self)
        
        circle = createCircle(radius, strokeWidth: strokeWidth, color: color)
        createConstraints(platform: platform, radius: radius)
        
        let circleFrame = CGRect(
            x: radius * 2 - strokeWidth,
            y: radius - strokeWidth / 2,
            width: strokeWidth,
            height: strokeWidth)
        createRoundView(circleFrame, color: color)
        
        backgroundColor = UIColor.clear
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: create
    fileprivate func createCircle(_ radius: CGFloat, strokeWidth: CGFloat, color: UIColor?) -> CAShapeLayer {
        
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: radius, y: radius),
            radius: CGFloat(radius) - strokeWidth / 2.0,
            startAngle: CGFloat(0),
            endAngle:CGFloat.pi * 2,
            clockwise: true)
        
        let circle = Init(CAShapeLayer()) {
            $0.path        = circlePath.cgPath
            $0.fillColor   = UIColor.clear.cgColor
            
            //set animation round color here
            $0.strokeColor = appUIColor_First.cgColor
            $0.lineWidth   = strokeWidth
        }
        
        self.layer.addSublayer(circle)
        return circle
    }
    
    fileprivate func createConstraints(platform: UIView, radius: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        // added constraints
        let sizeConstraints = [NSLayoutAttribute.width, .height].map {
            NSLayoutConstraint(item: self,
                               attribute: $0,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: $0,
                               multiplier: 1,
                               constant: radius * 2.0)
        }
        addConstraints(sizeConstraints)
        
        let centerConstaraints = [NSLayoutAttribute.centerY, .centerX].map {
            NSLayoutConstraint(item: platform,
                               attribute: $0,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: $0,
                               multiplier: 1,
                               constant:0)
        }
        platform.addConstraints(centerConstaraints)
    }
    
    internal func createRoundView(_ rect: CGRect, color: UIColor?) {
        let roundView = Init(UIView(frame: rect)) {
            $0.backgroundColor = UIColor.black
            $0.layer.cornerRadius = rect.size.width / 2.0
            $0.backgroundColor = color
        }
        addSubview(roundView)
    }
    
    // MARK: animations
    
    internal func fillAnimation(_ duration: Double, startAngle: Float, completion: @escaping () -> Void) {
        guard circle != nil else {
            return
        }
        
        let rotateTransform = CATransform3DMakeRotation(CGFloat(startAngle.degrees), 0, 0, 1)
        layer.transform = rotateTransform
        
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        let animation = Init(CABasicAnimation(keyPath: "strokeEnd")) {
            $0.duration       = CFTimeInterval(duration)
            $0.fromValue      = (0)
            $0.toValue        = (1)
            $0.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        }
        circle?.add(animation, forKey: nil)
        CATransaction.commit()
    }
    
    internal func hideAnimation(_ duration: CGFloat, delay: Double, completion: @escaping () -> Void) {
        
        let scale = Init(CABasicAnimation(keyPath: "transform.scale")) {
            $0.toValue             = 1.2
            $0.duration            = CFTimeInterval(duration)
            $0.fillMode            = kCAFillModeForwards
            $0.isRemovedOnCompletion = false
            $0.timingFunction      = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            $0.beginTime           = CACurrentMediaTime() + delay
        }
        layer.add(scale, forKey: nil)
        
        UIView.animate(
            withDuration: CFTimeInterval(duration),
            delay: delay,
            options: UIViewAnimationOptions.curveEaseIn,
            animations: { () -> Void in
                self.alpha = 0
                
        },
            completion: { (success) -> Void in
                self.removeFromSuperview()
                completion()
        })
    }
}
