//
//  InspectorViewController.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 05/05/22.
//

import Cocoa

final class InspectorViewController: NSViewController {

    @IBOutlet private weak var positionX: NSTextField!
    @IBOutlet private weak var positionY: NSTextField!
    @IBOutlet private weak var width: NSTextField!
    @IBOutlet private weak var height: NSTextField!
    @IBOutlet private weak var colorWell: NSColorWell!
    
    var shape: Shape?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func update(_ sender: Any) {
        guard let type = shape?.type, let frame = shape?.frame else { return }
        // New Frame
        let newFrame = CGRect(x: positionX.stringValue.CGFloatValue() ?? frame.origin.x,
                              y: positionY.stringValue.CGFloatValue() ?? frame.origin.y,
                              width: width.stringValue.CGFloatValue() ?? frame.width,
                              height: height.stringValue.CGFloatValue() ?? frame.height)
        // Updated shape
        let newShape = Shape(color: colorWell.color.cgColor, type: type, frame: newFrame)
        self.shape = newShape
        updateCanvas(newShape: self.shape)
    }
    
    func updateCanvas(newShape: Shape?) {
        guard let parent = self.parent else { return }
        let entityManager = ShapeUpdaterManager(parent: parent)
        entityManager.updateCanvasView(newShape)
    }
    
    func updateInspectorData() {
        guard let frame = shape?.frame, let color = shape?.color else { return }
        self.positionX.stringValue = frame.origin.x.format()
        self.positionY.stringValue = frame.origin.y.format()
        self.width.stringValue = frame.width.format()
        self.height.stringValue = frame.height.format()
        colorWell.color = NSColor(cgColor: color) ?? .clear
    }
}
