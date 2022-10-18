//
//  CropPointCircle.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 10/5/22.
//

import SwiftUI

struct CropPointCircle: View
{
    //@Binding var point : CropPoint
    
    var body: some View
    {
        ZStack
        {
            Circle()
                .opacity(ViewConstants.cropPoint.opacity)
            
            Circle()
                .stroke(style: StrokeStyle())
        }
        .frame(height: ViewConstants.cropPoint.diameter)
    }
}

struct CropPointCircle_Previews: PreviewProvider
{
    static var previews: some View
    {
        CropPointCircle()//point: .constant(CropPoint.zero))
    }
}
