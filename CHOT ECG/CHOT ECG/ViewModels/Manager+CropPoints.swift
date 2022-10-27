//
//  Manager+CropPoints.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 10/13/22.
//

import Foundation

extension ECGAppManager
{
    func movePointBy(point: CropPoint, x: Double, y: Double)
    {
        self.cropPoints = self.cropPoints.map
        {
            var _point = $0
            
            // Move Column horizontally
            if _point.column == point.column
            {
                _point.moveBy(x: x)
            }
            
            // Move row vertically
            if _point.row == point.row
            {
                _point.moveBy(y: y)
            }
            
            return point
        }
    }
    
    /// Set the initial position of the CropPoints on a scan image
    /// Could probably base the x and y off of the column and row numbers,
    /// this is just borrowed from another project at the moment
    static func initCropPoints() -> [CropPoint]
    {
        var points : [CropPoint] = []
        var x : Double = CropPointConstants.x_inital
        var y : Double = CropPointConstants.y_inital
        var row : Int = 0
        var column : Int = 0
        
        for _ in 0..<12
        {
            points.append(
                CropPoint(
                    x: x,
                    y: y,
                    offset: 0,
                    row: row,
                    column: column)
            )
            
            x += CropPointConstants.x_step
            column += 1
            
            if x == CropPointConstants.x_inital + (CropPointConstants.x_step * CropPointConstants.x_row_count)
            {
                x = CropPointConstants.x_inital
                column = 0
                
                y += CropPointConstants.y_step
                row += 1
            }
        }
        
        return points
    }
}

struct CropPointConstants
{
    static let y_inital : Double = 50
    static let x_inital : Double = 0
    static let x_step   : Double = 25
    static let y_step   : Double = 100
    static let x_row_count : Double = 4
    //static let block_size  = 40
}
