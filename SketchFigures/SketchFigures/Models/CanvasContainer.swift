//
//  ClickManager.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 03/05/22.
//

import Cocoa

protocol CanvasListener {
    func onMouseClick(position: CGPoint)
}

final class CanvasContainer: NSView {
    
    var delegate: CanvasListener?
    
    override func mouseDown(with theEvent: NSEvent) {
        let position = CGPoint(x: theEvent.locationInWindow.x, y: theEvent.locationInWindow.y)
        delegate?.onMouseClick(position: position)
    }
    
    override func rightMouseDown(with theEvent: NSEvent) {
        print("right mouse")
    }
}
