//
//  DrawView.swift
//  WhiteBoard
//
//  Created by 黄启明 on 2017/8/22.
//  Copyright © 2017年 Himin. All rights reserved.
//

import UIKit

enum DrawMode {
    case none
    case draw
    case erase
}

class DrawView: UIView {

    fileprivate let lineWidth: CGFloat = 1.0
    fileprivate let lineColor: UIColor = UIColor.orange
    fileprivate var lines: [CAShapeLayer] = []
    fileprivate var shapeLayer: CAShapeLayer?
    fileprivate var bezierPath: UIBezierPath?
    
}

extension DrawView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let startP = pointWithTouches(touches)
        print(startP)
        if event?.allTouches?.count == 1 {
            let path = paintPath(startPoint: startP)
            bezierPath = path
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            layer.fillColor = UIColor.clear.cgColor
            layer.backgroundColor = UIColor.clear.cgColor
            layer.lineCap = kCALineCapRound
            layer.lineJoin = kCALineJoinRound
            layer.strokeColor = lineColor.cgColor
            layer.lineWidth = path.lineWidth
            self.layer.addSublayer(layer)
            shapeLayer = layer
            lines.append(layer)
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let moveP = pointWithTouches(touches)
        print(moveP)
        if event?.allTouches?.count ?? 0 > 1 {
            superview?.touchesMoved(touches, with: event)
        }
        else if event?.allTouches?.count ?? 0 == 1 {
            bezierPath?.addLine(to: moveP)
            shapeLayer?.path = bezierPath?.cgPath
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if event?.allTouches?.count ?? 0 > 1 {
            superview?.touchesEnded(touches, with: event)
        }
    }
}

extension DrawView {
    fileprivate func pointWithTouches(_ touches: Set<UITouch>) -> CGPoint {
        guard let touch = touches.first else { return CGPoint(x: 0, y: 0) }
        return touch.location(in: self)
    }
    
    fileprivate func paintPath(startPoint: CGPoint) -> UIBezierPath {
        let path = UIBezierPath()
        path.lineWidth = lineWidth
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        path.move(to: startPoint)
        return path
    }
}

