//
//  ViewModel.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 05/05/22.
//

import Cocoa

final class ViewModel {

    func build(at position: CGPoint) -> ShapeView {
        // Generate Random features of each shape
        let factory = ShapeFactory()
        let shapeType = RandomHelper.randomShapeType()
        let color = RandomHelper.randomColor() ?? .black
        let frame = RandomHelper.randomFrame(at: position)
        let shape = Shape(color: color, type: shapeType)
        // Build the shape view
        let shapeView = ShapeView(shape: shape, frame: frame) {
            let context = NSGraphicsContext.current?.cgContext
            factory.draw(shape: shape, frame: frame, in: context)
        }
        return shapeView
    }
}
