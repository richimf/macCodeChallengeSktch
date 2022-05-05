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
    
    func updateInspectorView(with data: Shape) {
        guard let splitViewController = parent,
              let inspectorVC = splitViewController.splitViewItems.first?.viewController as? InspectorViewController else { return }
        inspectorVC.data = data
        inspectorVC.updateInspectorData()
    }

    func updateCanvasView(with data: Shape) {
        guard let splitViewController = parent,
              let canvasVC = splitViewController.splitViewItems.last?.viewController as? ViewController else { return }
        canvasVC.updateFromInspector()
    }
}
