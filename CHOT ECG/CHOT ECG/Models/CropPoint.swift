//
//  CropPoint.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 10/5/22.
//

import Foundation


/// Crop points are the circles on the corners of the grid for cropping
/// an ECG scan into its 12 leads
struct CropPoint
{
    var x : Double
    var y : Double
    let row    : Int
    let column : Int
    
    static let zero = CropPoint(x: 0, y: 0, row: 0, column: 0)
}
