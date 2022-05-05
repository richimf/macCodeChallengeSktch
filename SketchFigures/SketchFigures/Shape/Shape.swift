//
//  Figure.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 03/05/22.
//

import AppKit

enum ShapeType: Int, CaseIterable {
    case circle, square, rectangle, triangle//, square, rectangle, pentagon, hexagon
}
struct Shape {
    let color: CGColor
    let type: ShapeType
}
