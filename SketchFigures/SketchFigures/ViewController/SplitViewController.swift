//
//  SplitViewController.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 05/05/22.
//

import Cocoa

final class SplitViewController: NSSplitViewController {

    @IBOutlet private weak var inscpector: NSSplitViewItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        inscpector.canCollapse = false
    }
}
