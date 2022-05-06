//
//  Figure.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 03/05/22.
//

import AppKit

enum ShapeType: Int, CaseIterable {
    case circle, square, triangle
}
struct Shape {
    var color: CGColor
    let type: ShapeType
    var frame: CGRect
}
extension Shape {
    func translate() -> ShapeMirror? {
        let type = self.type.rawValue
        let rect = Frame(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.height)
        return ShapeMirror(color: color.colorToHexString(), type: type, frame: rect)
    }
}

struct ShapeMirror: Codable {
    var color: String
    let type: Int
    var frame: Frame
}
extension ShapeMirror {
    func translate() -> Shape? {
        guard let type = ShapeType(rawValue: self.type) else { return nil }
        let rect = CGRect(x: frame.x, y: frame.y, width: frame.width, height: frame.height)
        return Shape(color: self.color.colorWithHexString(), type: type, frame: rect)
    }
}
struct Frame: Codable {
    let x: Double
    let y: Double
    let width: Double
    let height: Double
}

struct ShapeMirrorStack: Codable {
    let shapes: [ShapeMirror]
}
