//
//  GradientCircularProgress.swift
//  ProgressView
//
//  Created by Arijit Sarkar on 16/07/20.
//  Copyright © 2020 Arijit Sarkar. All rights reserved.
//

import UIKit

public class ASGradientCircularProgress: UIView {
    
    public var trackColor: UIColor = UIColor.black.withAlphaComponent(0.1) {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    public var trackWidth: CGFloat = 20 {
        didSet {
            trackLayer.lineWidth = trackWidth
        }
    }
    public var progressLineWidth: CGFloat = 20 {
        didSet {
            radius = (bounds.size.width - progressLineWidth) / 2
            circularPath = UIBezierPath(arcCenter: CGPoint(x: bounds.width / 2, y: bounds.height / 2),
                                        radius: radius,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
            gradientProgressLayer.path = circularPath.cgPath
            gradientProgressLayer.lineWidth = progressLineWidth
        }
    }
    public var lineCap: CAShapeLayerLineCap = .round {
        didSet {
            gradientProgressLayer.lineCap = lineCap
        }
    }
    public var startAngle: CGFloat = CGFloat.pi / 2 {
        didSet {
            radius = (bounds.size.width - progressLineWidth) / 2
            circularPath = UIBezierPath(arcCenter: CGPoint(x: bounds.width / 2, y: bounds.height / 2),
                                        radius: radius,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
            gradientProgressLayer.path = circularPath.cgPath
            trackLayer.path = circularPath.cgPath
        }
    }
    public var endAngle: CGFloat = (CGFloat.pi * 2) + (CGFloat.pi / 2) {
        didSet {
            radius = (bounds.size.width - progressLineWidth) / 2
            circularPath = UIBezierPath(arcCenter: CGPoint(x: bounds.width / 2, y: bounds.height / 2),
                                        radius: radius,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
            gradientProgressLayer.path = circularPath.cgPath
            trackLayer.path = circularPath.cgPath
        }
    }
    public var gradientColors: [Any] = [UIColor.red.cgColor, UIColor.yellow.cgColor] {
        didSet {
            gradientLayer.colors = gradientColors
        }
    }
    public var gradientStartPoint: CGPoint = CGPoint(x: 0.0, y: 0.0) {
        didSet {
            gradientLayer.startPoint = gradientStartPoint
        }
    }
    public var gradientEndPoint: CGPoint = CGPoint(x: 1.0, y: 1.0) {
        didSet {
            gradientLayer.endPoint = gradientEndPoint
        }
    }
    public var gradientLocations: [NSNumber] = [0.3, 0.6] {
        didSet {
            gradientLayer.locations = gradientLocations
        }
    }
    public var gradientType: CAGradientLayerType = .axial {
        didSet {
            gradientLayer.type = gradientType
        }
    }
    public var progressTextFont: UIFont = UIFont.systemFont(ofSize: 30) {
        didSet {
            progressTextLayer.font = progressTextFont
            addTextLayer()
        }
    }
    public var progressTextColor: UIColor = .black {
        didSet {
            progressTextLayer.foregroundColor = progressTextColor.cgColor
        }
    }
    
    private var radius: CGFloat = 0
    private var circularPath: UIBezierPath!
    private var trackLayer = CAShapeLayer()
    private var gradientProgressLayer = CAShapeLayer()
    private var gradientLayer = CAGradientLayer()
    private var progressTextLayer = CATextLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        radius = (bounds.size.width - progressLineWidth) / 2
        circularPath = UIBezierPath(arcCenter: CGPoint(x: bounds.width / 2, y: bounds.height / 2),
                                    radius: radius,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)
        addTrackLayer()
        addGradientProgressLayer()
        addTextLayer()
    }
    
    private func addTrackLayer() {
        
        if trackLayer.superlayer == nil {

            trackLayer.path = circularPath.cgPath
            trackLayer.strokeColor = trackColor.cgColor
            trackLayer.lineWidth = trackWidth
            trackLayer.fillColor = UIColor.clear.cgColor
            trackLayer.lineCap = .round
            trackLayer.strokeStart = 0
            trackLayer.strokeEnd = 1
            trackLayer.frame = bounds
            self.layer.addSublayer(trackLayer)
            
        } else {
            
            trackLayer.frame = bounds
        }
    }
    
    private func addGradientProgressLayer() {
        
        if gradientLayer.superlayer == nil {
        
            gradientProgressLayer.path = circularPath.cgPath
            gradientProgressLayer.strokeColor = UIColor.black.cgColor
            gradientProgressLayer.lineWidth = progressLineWidth
            gradientProgressLayer.fillColor = UIColor.clear.cgColor
            gradientProgressLayer.lineCap = lineCap
            gradientProgressLayer.strokeStart = 0
            gradientProgressLayer.strokeEnd = 0
            
            gradientLayer.startPoint = gradientStartPoint
            gradientLayer.endPoint = gradientEndPoint
            gradientLayer.locations = gradientLocations
            gradientLayer.colors = gradientColors
            gradientLayer.type = gradientType
            gradientLayer.frame = bounds
            gradientLayer.mask = gradientProgressLayer
            self.layer.addSublayer(gradientLayer)
            
        } else {
            
            gradientLayer.frame = bounds
        }
    }
    
    private func addTextLayer() {
        
        if progressTextLayer.superlayer == nil {
            
            progressTextLayer.font = progressTextFont
            progressTextLayer.fontSize = progressTextFont.pointSize
            progressTextLayer.foregroundColor = progressTextColor.cgColor
            progressTextLayer.alignmentMode = .center
            progressTextLayer.frame = CGRect(x: 0,
                                             y: (bounds.height - progressTextFont.pointSize) / 2,
                                             width: bounds.width,
                                             height: progressTextFont.pointSize)
            progressTextLayer.contentsScale = UIScreen.main.scale
            self.layer.addSublayer(progressTextLayer)
            
        } else {
            
            progressTextLayer.frame = CGRect(x: 0,
                                             y: (bounds.height - progressTextFont.pointSize) / 2,
                                             width: bounds.width,
                                             height: progressTextFont.pointSize)
        }
    }
    
    public func setProgress(to: Int) {
        gradientProgressLayer.strokeEnd = CGFloat(to) / 100.0
    }
    
    public func setProgressText(to: String) {
        progressTextLayer.string = to
    }
    
    public func setProgressWithAnimation(to: Int) {
        let value = CGFloat(to) / 100.0
        gradientProgressLayer.strokeAnimation(fromValue: gradientProgressLayer.strokeEnd, toValue: value)
    }
    
}

extension CAShapeLayer {
    
    public func strokeAnimation(fromValue from: CGFloat, toValue to: CGFloat, withAnimationDuration animationDuration: Double = 0.5, afterDelay delay: Double = 0.0) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fillMode = .forwards
        animation.beginTime = CACurrentMediaTime() + delay
        animation.fromValue = from
        animation.toValue = to
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.duration = animationDuration
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        self.add(animation, forKey: "strokeAnimation")
    }
    
}
