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
    
    @IBInspectable open var radiusFactor: CGFloat = 0.7
    @IBInspectable open var shift: CGFloat = 0
    
    private var circularConstraints: [NSLayoutConstraint] = []
    
    private func setupConstraints() {
        for constraint in circularConstraints {
            removeConstraint(constraint)
        }
        guard subviews.isEmpty == false else { return }
        
        let radius = min(frame.size.width / 2, frame.size.height / 2) * radiusFactor
        let step: CGFloat = CGFloat(360 / subviews.count)
        for i in stride(from: 0, to: subviews.count, by: 1) {
            let angle = CGFloat(i) * step + shift
            let x = radius * cos(angle.degreesToRadians)
            let y = radius * sin(angle.degreesToRadians)
            
            subviews[i].translatesAutoresizingMaskIntoConstraints = false
            let centerXConstraint = NSLayoutConstraint.init(item: subviews[i], attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: x)
            let centerYConstraint = NSLayoutConstraint.init(item: subviews[i], attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: y)
            
            addConstraints([centerXConstraint, centerYConstraint])
            circularConstraints.append(contentsOf: [centerXConstraint, centerYConstraint])
        }
    }
    
    // MARK: - Overrides
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        setupConstraints()
    }
    
    override open func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        
        setupConstraints()
    }
    
    override open func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
        
        setupConstraints()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews {
            if !subview.isHidden && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }

}
