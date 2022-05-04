//
//  ViewController.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 03/05/22.
//

import Cocoa

class ViewController: NSViewController {
    
    private lazy var canvas: CanvasContainer = {
        let container = CanvasContainer(frame: self.view.frame)
        container.delegate = self
        return container
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = canvas
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    private func createShapeOn(position: CGPoint) {
        print("Coordinates x: \(position.x), y: \(position.y)")
    }
}
extension ViewController: CanvasListener {
    func onMouseClick(position: CGPoint) {
        createShapeOn(position: position)
    }
}
