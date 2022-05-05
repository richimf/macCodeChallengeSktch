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
    
    var data: Shape?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func update(_ sender: Any) {
        print(#function)
        updateCanvas()
    }
    
    func updateCanvas() {
        guard let parent = self.parent, let updatedShape = data else { return }
        let entityManager = ShapeEntityManager(parent: parent)
        entityManager.updateCanvasView(with: updatedShape)
    }
    
    func updateInspectorData() {
        if let originX = data?.frame.origin.x {
            self.positionX.stringValue = originX.format()
        }
        if let originY = data?.frame.origin.y {
            self.positionY.stringValue = originY.format()
        }
        if let width = data?.frame.width {
            self.width.stringValue =  width.format()
        }
        if let height = data?.frame.height {
            self.height.stringValue =  height.format() 
        }
        if let color = data?.color {
            colorWell.color = NSColor(cgColor: color) ?? .clear
        }
    }
}
