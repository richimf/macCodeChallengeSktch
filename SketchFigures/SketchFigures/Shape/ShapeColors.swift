//
//  ShapeColors.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 05/05/22.
//

import Cocoa

enum ShapeColor: Int, CaseIterable {
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
