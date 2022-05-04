//
//  ShapeFactory.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 04/05/22.
//

import Cocoa

enum ShapeType: Int, CaseIterable {
    case circle, triangle, square, rectangle, pentagon, hexagon
}
final class ShapeFactory {
    
    func random() -> ShapeType {
        let randomInt = Int.random(in: 0...ShapeType.allCases.count)
        return ShapeType(rawValue: randomInt) ?? .circle
    }
    
    func draw(frame: CGRect, in context: CGContext?, shape: ShapeType) {
        if shape == .rectangle || shape == .square {
            drawRect(frame: frame, inContext: context, borderColor: NSColor.red.cgColor, fillColor: NSColor.green.cgColor)
        }
        if shape == .circle {
            drawCircle(frame: frame, inContext: context, borderColor: NSColor.red.cgColor, fillColor: NSColor.green.cgColor)
        }
    }

    private func drawRect(frame: CGRect, inContext context: CGContext?, borderColor: CGColor, fillColor: CGColor) {
        let rect = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        let path = CGMutablePath()
        path.addRect(rect)
        path.closeSubpath()
        context?.setLineWidth(1.0)
        context?.setFillColor(fillColor)
        context?.setStrokeColor(borderColor)
        context?.addPath(path)
        context?.drawPath(using: .fillStroke)
    }
    
    private func drawCircle(frame: CGRect, inContext context: CGContext?, borderColor: CGColor, fillColor: CGColor) {
        let circleRect = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        let path = CGMutablePath()
        path.addRect(circleRect)
        path.closeSubpath()
        context?.setLineWidth(1.0)
        context?.setFillColor(fillColor)
        context?.setStrokeColor(borderColor)
        context?.addPath(path)
        context?.drawPath(using: .fillStroke)
        context?.strokeEllipse(in: circleRect)
    }

}
