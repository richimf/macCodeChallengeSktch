//
//  CGColor+Ext.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 06/05/22.
//

import Cocoa

extension CGColor {
    func colorToHexString() -> String {
        let components = self.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0
        return String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
    }
}
