//
//  ViewModel.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 05/05/22.
//

import Cocoa

protocol PresenterDelegate {
    func refreshView()
}

final class Presenter {
        
    private let fileManager = FileManagerHelper()
    var delegate: PresenterDelegate?
    var stackView: [ShapeView] = []

    // MARK: - SHAPE CREATION AND UPDATE
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
    
    // MARK: - FILE MANAGMENT
    func open() {
        fileManager.openFile() { shapeMirrorStack in
            shapeMirrorStack.shapes.forEach { shapeMirror in
                self.stackView.append(self.updateShape(shape: shapeMirror.translate()!))
            }
            self.delegate?.refreshView()
        }
    }
    
    func save() {
        let shapes = self.stackView.compactMap { $0.shape.translate() }
        let mirrorStack = ShapeMirrorStack(shapes: shapes)
        fileManager.saveFile(contents: mirrorStack)
    }
    
    func saveAs() {
        let data = self.stackView.last
        fileManager.saveAs(contents: data?.shape.translate())
    }
}
