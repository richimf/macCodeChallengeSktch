//
//  ShapeFactory.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 04/05/22.
//

import Cocoa

final class ShapeFactory {

    func draw(shape: Shape, frame: CGRect, in context: CGContext?) {
        let type = shape.type
        let color = shape.color
        if type == .rectangle || type == .square {
            drawRect(frame: frame, inContext: context, fillColor: color)
        }
        if type == .circle {
            drawCircle(frame: frame, inContext: context, fillColor: color)
        }
        if type == .triangle {
            drawTriangle(frame: frame, inContext: context, fillColor: color)
        }
    }

    private func drawRect(frame: CGRect, inContext context: CGContext?, borderColor: CGColor = .clear, fillColor: CGColor) {
        let rect = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        let finalRect = rect.insetBy(dx: 5.0, dy: 5.0)
        let path = CGMutablePath()
        path.addRect(finalRect)
        path.closeSubpath()
        context?.setLineWidth(1.0)
        context?.setFillColor(fillColor)
        context?.setStrokeColor(borderColor)
        context?.addPath(path)
        context?.drawPath(using: .fillStroke)
    }
    
    private func drawCircle(frame: CGRect, inContext context: CGContext?, borderColor: CGColor = .clear, fillColor: CGColor) {
        let rect = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        let finalRect = rect.insetBy(dx: 5.0, dy: 5.0)
        context?.setLineWidth(1.0)
        context?.setFillColor(fillColor)
        context?.setStrokeColor(borderColor)
        context?.fillEllipse(in: finalRect)
        context?.strokeEllipse(in: finalRect)
    }
    
    private func drawTriangle(frame: CGRect, inContext context: CGContext?, borderColor: CGColor = .clear, fillColor: CGColor) {
        let rect = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        let finalRect = rect.insetBy(dx: 5.0, dy: 5.0)
        let sideSize = finalRect.width
        let path = CGMutablePath()
        path.move(to: CGPoint(x: sideSize/2, y: 0.0))
        path.addLine(to: CGPoint(x: sideSize, y: sideSize/2))
        path.addLine(to: CGPoint(x: sideSize/2, y: sideSize))
        path.addLine(to: CGPoint(x: sideSize/2, y: 0.0))
        path.closeSubpath()
        context?.setLineWidth(1.0)
        context?.setFillColor(fillColor)
        context?.setStrokeColor(NSColor.red.cgColor)
        context?.addPath(path)
        context?.drawPath(using: .fillStroke)
    }

}
