
//  CircleIconView.swift
//  CircleMenu


import UIKit
import Foundation

class CircleIconView: UIView {
    
    public var image: UIImage?
    public var highlightedIconColor = UIColor.green
    public var isSelected: Bool {
        didSet {
            if oldValue != isSelected {
                self.setNeedsDisplay()
            }
        }
    }
    
    override init(frame: CGRect) {
        isSelected = false
        
        super.init(frame: frame)
        
        isOpaque = false
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard image != nil else {
            return
        }
        
        if isSelected {
            
            image?.draw(in: rect)
        }
        else {
          
            image?.draw(in: rect)
   
        }
    }
    
}
