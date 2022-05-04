//
//  ShapeView.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 04/05/22.
//

import AppKit

final class ShapeView: NSView {
    
    typealias DrawCompletion = () -> Void
    private let draw: DrawCompletion
    private let shape: Shape

    init(shape: Shape, frame: CGRect, draw: @escaping DrawCompletion) {
        self.shape = shape
        self.draw = draw
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        draw()
      }
}
