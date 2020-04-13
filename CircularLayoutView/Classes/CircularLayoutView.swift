//
//  CircularLayoutView.swift
//  CircularLayoutView
//
//  Created by Ahmed Khalaf on 1/1/18.
//  Copyright © 2018 Ahmed Khalaf. All rights reserved.
//

import UIKit

@IBDesignable
open class CircularLayoutView: UIView {
    
    /// Controls the padding.
    /// Values: From 0 to 1.
    @IBInspectable open var radiusFactor: CGFloat = 0.7
    
    /// Controls the start angle of the final arrangement. Values: in degrees, +ve clockwise, -ve counter-clockwise.
    @IBInspectable open var shift: CGFloat = 0
    
    // MARK: - Overrides
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        guard subviews.isEmpty == false else { return }
        
        let radius = min(frame.size.width / 2, frame.size.height / 2) * radiusFactor
        let step: CGFloat = .pi * 2 / CGFloat(subviews.count)
        for i in 0..<subviews.count {
            let angle = CGFloat(i) * step + shift.degreesToRadians
            let x = radius * cos(angle)
            let y = radius * sin(angle)
            
            subviews[i].center = CGPoint(x: bounds.midX + x, y: bounds.midY + y)
        }
    }
    
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sizeToFitSubviewIfNeeded(subview: view)
        setNeedsLayout()
    }
    
    open override func insertSubview(_ view: UIView, at index: Int) {
        super.insertSubview(view, at: index)
        sizeToFitSubviewIfNeeded(subview: view)
        setNeedsLayout()
    }
    
    open override func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView) {
        super.insertSubview(view, aboveSubview: siblingSubview)
        sizeToFitSubviewIfNeeded(subview: view)
        setNeedsLayout()
    }
    
    open override func insertSubview(_ view: UIView, belowSubview siblingSubview: UIView) {
        super.insertSubview(view, belowSubview: siblingSubview)
        sizeToFitSubviewIfNeeded(subview: view)
        setNeedsLayout()
    }
    
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews {
            if !subview.isHidden && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }
    
    // MARK: - Private
    private func sizeToFitSubviewIfNeeded(subview: UIView) {
        // For convenience, size-to-fit non-autolayout views that have intrinsic content size.
        if subview.translatesAutoresizingMaskIntoConstraints && subview.bounds.size == .zero {
            subview.sizeToFit()
        }
    }

}
