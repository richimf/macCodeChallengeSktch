//
//  RandomHelper.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 05/05/22.
//

import Cocoa

final class RandomHelper {

    static func randomShapeType() -> ShapeType {
        let randomInt = Int.random(in: 0...ShapeType.allCases.count)
        return ShapeType(rawValue: randomInt) ?? .circle
    }

    static func randomFrame(at position: CGPoint) -> CGRect {
        let randomSize = CGFloat(Int.random(in: 60...150))
        let rect = CGRect(x: position.x, y: position.y, width: randomSize, height: randomSize)
        let finalRect = rect.insetBy(dx: 5.0, dy: 5.0)
        return finalRect
    }

    static func randomColor() -> CGColor? {
        let randomInt = Int.random(in: 0..<ShapeColor.allCases.count)
        return ShapeColor(rawValue: randomInt)?.getColor()
    }
}
