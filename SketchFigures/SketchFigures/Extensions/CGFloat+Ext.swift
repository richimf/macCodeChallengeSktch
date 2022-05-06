//
//  CGFloat+Ext.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 05/05/22.
//

import Foundation

extension CGFloat {
    /// Return long decimal value as String with single decimal point
    func format() -> String {
        return String(format: "%.1f", self)
    }
}
