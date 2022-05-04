//
//  ViewController.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 03/05/22.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var canvas: CanvasContainer!
//
//    private lazy var canvas: CanvasContainer = {
//        let frame = CGRect(x: 0.0, y: 0.0, width: 500, height: 500)
//        let container = CanvasContainer(frame: frame)
//        container.delegate = self
//        container.needsDisplay = true
//        return container
//    }()

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
        print("Coordinates x: \(position.x), y: \(position.y)")
        // TODO: ADJUST POSITION INTO CANVAS
        let frame = CGRect(x: position.x, y: position.y, width: 20.0, height: 30.0)
        let figure = Shape(color: NSColor.green, stroke: 2.0, numberOfSides: 4)
        
        let shape = ShapeView(shape: figure, frame: frame) {
            let context = NSGraphicsContext.current?.cgContext
            ShapeFactory().draw(frame: frame, in: context, shape: .square)
        }
        print("shape: \(shape.frame.origin)")
        self.view.updateLayer()
        self.canvas.addSubview(shape)
    }
}
extension ViewController: CanvasListener {
    func onMouseClick(position: CGPoint) {
        createShapeOn(position: position)
    }
}
