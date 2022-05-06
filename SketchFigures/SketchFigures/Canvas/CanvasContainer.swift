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

/// This class is the white canvas displayed on the screen
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
        let eventPosition = CGPoint(x: theEvent.locationInWindow.x - 250, y: theEvent.locationInWindow.y - 50)
        delegate?.onMouseClick(position: eventPosition)
    }
    
    override func rightMouseDown(with theEvent: NSEvent) {
        print("right mouse")
    }
}
