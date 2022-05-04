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
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.wantsLayer = true
        self.layer?.cornerRadius = 0.0
        self.layer?.borderWidth = 0.5
        self.layer?.borderColor = NSColor.lightGray.cgColor
        self.layer?.backgroundColor = .white
        self.layer?.masksToBounds = true
    }

    override func mouseDown(with theEvent: NSEvent) {
        let eventPosition = CGPoint(x: theEvent.locationInWindow.x, y: theEvent.locationInWindow.y)
        delegate?.onMouseClick(position: eventPosition)
    }
    
    override func rightMouseDown(with theEvent: NSEvent) {
        print("right mouse")
    }
}
