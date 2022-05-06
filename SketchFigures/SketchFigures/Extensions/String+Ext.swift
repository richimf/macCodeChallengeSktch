//
//  String+Ext.swift
//  SketchFigures
//
//  Created by Ricardo Montesinos on 05/05/22.
//

import Foundation

extension String {
  /// Convert String value to CGFloat
  func CGFloatValue() -> CGFloat? {
    guard let doubleValue = Double(self) else {
      return nil
    }
    return CGFloat(doubleValue)
  }
}
