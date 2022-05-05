//
//  ViewController.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 03/05/22.
//

import Cocoa

final class ViewController: NSViewController {
    
    @IBOutlet private weak var canvas: CanvasContainer!
    
    private let viewModel = ViewModel()

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
         }
    }

    private func createShapeOn(position: CGPoint) {
        // TODO: MOVE THIS TO THE VIEWMODEL
        let shapeView = viewModel.build(at: position)
        shapeView.setPanGesture(target: self, delegate: self, selector: #selector(handlePan(_:)))
        shapeView.setClickGesture(target: self, delegate: self, selector: #selector(handleClick(_:)))
        self.view.updateLayer()
        self.canvas.addSubview(shapeView)
    }

    // MARK: - GESTURE SELECTORS
    @objc private func handlePan(_ gesture: NSPanGestureRecognizer) {
        guard let shapeView = gesture.view as? ShapeView else { return }
        let distance = gesture.translation(in: shapeView)
        let newCenter = CGPoint(x: shapeView.frame.origin.x + distance.x, y: shapeView.frame.origin.y + distance.y)
        shapeView.frame.origin = newCenter
        shapeView.shape.frame = shapeView.frame
        gesture.setTranslation(CGPoint.zero, in: shapeView)
        // Update Inspector
        updateInspectorAtt(from: shapeView)
    }
    
    @objc private func handleClick(_ gesture: NSClickGestureRecognizer) {
        guard let shapeView = gesture.view as? ShapeView else { return }
        // Update Inspector
        updateInspectorAtt(from: shapeView)
    }
    
    private func updateInspectorAtt(from shapeView: ShapeView) {
        guard let parent = self.parent else { return }
        let entityManager = ShapeEntityManager(parent: parent)
        entityManager.updateInspectorView(with: shapeView.shape)
    }
    
    func updateFromInspector() {
        print("update selected shape")
    }
}
// MARK: - MOUSE EVENTS
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
