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
    var shape: Shape

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
extension ShapeView {
    func setPanGesture(target: Any?, delegate: NSGestureRecognizerDelegate?, selector: Selector?) {
        let pan: NSPanGestureRecognizer = NSPanGestureRecognizer(target: target, action: selector)
        pan.delegate = delegate
        self.addGestureRecognizer(pan)
    }
    
    func setClickGesture(target: AnyObject?, delegate: NSGestureRecognizerDelegate?, selector: Selector?) {
        let clickGesture: NSClickGestureRecognizer = NSClickGestureRecognizer(target: target, action: selector)
        clickGesture.delegate = delegate
        clickGesture.target = target
        clickGesture.numberOfClicksRequired = 1
        clickGesture.action = selector
        self.addGestureRecognizer(clickGesture)
    }
}
