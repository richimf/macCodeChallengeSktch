//
//  ClickManager.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 03/05/22.
//

import Cocoa

protocol CanvasListener {
    func onMouseClick()
}

final class CanvasContainer: NSView {
    
    var delegate: CanvasListener?
    
    override func mouseDown(with theEvent: NSEvent) {
        delegate?.onMouseClick()
    }
    
    override func rightMouseDown(with theEvent: NSEvent) {
        print("right mouse")
    }
}
