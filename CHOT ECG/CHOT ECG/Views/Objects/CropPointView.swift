//
//  CropPointView.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 10/5/22.
//

import SwiftUI

struct CropPointView: View
{
    @State var scale  = 1.0
    @State var offset = CGSize.zero
    @Binding var point : CropPoint
    
    var body: some View
    {
        let move = DragGesture()
            .onChanged
            {
                value in
                offset = value.translation
                scale = 1.2
            }
            .onEnded
            {
                value in
                offset = CGSize.zero
                scale = 1.0
            }
        
        ZStack
        {
            // This will be the scan itself eventually
            // Actually it won't this view is just for a specific point
            Rectangle()
                .foregroundColor(.red)
                .frame(height: 400) // no view constant this is just dev shit
            
            CropPointCircle()
                .scaleEffect(scale)
                .position(
                    x: point.x,
                    y: point.y
                )
                .gesture(move)
        }
    }
}

struct CropPointView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CropPointView(point: .constant(CropPoint.zero))
    }
}
