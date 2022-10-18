//
//  CropPoint.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 10/5/22.
//

import Foundation


/// Crop points are the circles on the corners of the grid for cropping
/// an ECG scan into its 12 leads
struct CropPoint : Identifiable
{
    var x : Double
    var y : Double
    var offset : Double
    let row    : Int
    let column : Int
    let id : Int
    
    init(x: Double, y: Double, offset: Double, row: Int, column: Int) {
        self.x = x
        self.y = y
        self.offset = offset
        self.row = row
        self.column = column
        
        self.id = row*5 + column
    }
    
    static let zero = CropPoint(x: 0, y: 0, offset: 0, row: 0, column: 0)
    
    mutating func moveBy(x: Double = 0, y: Double = 0)
    {
        self.x += x
        self.y += y
    }
}
