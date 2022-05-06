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
