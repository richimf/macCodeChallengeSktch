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
        enum ShapeColors: Int, CaseIterable {
            case red, green, blue, purple, yellow, cyan, magenta, orange
            func getColor() -> CGColor {
                switch self {
                case .red:
                    return NSColor.red.cgColor
                case .green:
                    return NSColor.green.cgColor
                case .blue:
                    return NSColor.blue.cgColor
                case .purple:
                    return NSColor.purple.cgColor
                case .yellow:
                    return NSColor.yellow.cgColor
                case .cyan:
                    return NSColor.cyan.cgColor
                case .magenta:
                    return NSColor.magenta.cgColor
                case .orange:
                    return NSColor.orange.cgColor
                }
            }
        }
        let randomInt = Int.random(in: 0..<ShapeColors.allCases.count)
        return ShapeColors(rawValue: randomInt)?.getColor()
    }
}
