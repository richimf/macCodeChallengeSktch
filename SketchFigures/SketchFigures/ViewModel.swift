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
        let shape = Shape(color: color, type: shapeType, frame: frame)
        // Build the shape view
        let shapeView = ShapeView(shape: shape, frame: frame) {
            let context = NSGraphicsContext.current?.cgContext
            factory.draw(shape: shape, frame: frame, in: context)
        }
        return shapeView
    }
    
    func updateShape(shape: Shape) -> ShapeView {
        let factory = ShapeFactory()
        let shapeView = ShapeView(shape: shape, frame: shape.frame) {
            let context = NSGraphicsContext.current?.cgContext
            factory.draw(shape: shape, frame: shape.frame, in: context)
        }
        return shapeView
    }
    
}
