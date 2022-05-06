//
//  ShapeEntityManager.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 05/05/22.
//

import Cocoa

final class ShapeEntityManager {
    
    private let parent: NSSplitViewController?
    
    init(parent: NSViewController) {
        self.parent = parent as? NSSplitViewController
    }
    
    func updateInspectorView(_ shape: Shape) {
        guard let splitViewController = parent,
              let inspectorVC = splitViewController.splitViewItems.first?.viewController as? InspectorViewController else { return }
        inspectorVC.shape = shape
        inspectorVC.updateInspectorData()
    }

    func updateCanvasView(_ shape: Shape?) {
        guard let splitViewController = parent,
              let canvasVC = splitViewController.splitViewItems.last?.viewController as? ViewController else { return }
        canvasVC.updateFromInspector(shape)
    }
}
