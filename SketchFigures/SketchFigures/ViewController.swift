//
//  ViewController.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 03/05/22.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var canvas: CanvasContainer!

    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.delegate = self
        canvas.needsDisplay = true
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.lightGray.cgColor
        self.view.addSubview(canvas)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    private func createShapeOn(position: CGPoint) {
        let frame = CGRect(x: position.x-50, y: position.y-40, width: 20.0, height: 30.0)
        let shapeModel = Shape(color: NSColor.green, stroke: 2.0, numberOfSides: 4)
        let shapeView = ShapeView(shape: shapeModel, frame: frame) {
            let context = NSGraphicsContext.current?.cgContext
            ShapeFactory().draw(frame: frame, in: context, shape: .square)
        }
        shapeView.setupGestures(target: self, delegate: self, selector: #selector(handlePan(_:)))
        self.view.updateLayer()
        self.canvas.addSubview(shapeView)
    }

    @objc private func handlePan(_ gesture: NSPanGestureRecognizer) {
        guard let targetView = gesture.view as? ShapeView else { return }
        let distance = gesture.translation(in: targetView)
        let newCenter = CGPoint(x: targetView.frame.origin.x + distance.x,
                                y: targetView.frame.origin.y + distance.y)
        targetView.frame.origin = newCenter
        gesture.setTranslation(CGPoint(x: 0, y: 0), in: targetView)
    }
}
extension ViewController: CanvasListener {
    func onMouseClick(position: CGPoint) {
        createShapeOn(position: position)
    }
}
// MARK: - GESTURES
extension ViewController: NSGestureRecognizerDelegate {
  func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: NSGestureRecognizer) -> Bool {
    return true
  }

  func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer, shouldAttemptToRecognizeWith event: NSEvent) -> Bool {
    return true
  }
}
