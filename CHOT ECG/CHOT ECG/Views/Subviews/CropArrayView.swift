//
//  CropArrayView.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 10/13/22.
//

import SwiftUI

struct CropArrayView: View
{
    @EnvironmentObject var manager : ECGAppManager
    
    var body: some View
    {
        ZStack
        {
            // image of scan
            
            
//            ForEach($manager.cropPoints, id: \.self)
//            {
//                $point in
//                
//                CropPointView(point: $point)
//            }
        }
    }
}

struct CropArrayView_Previews: PreviewProvider {
    static var previews: some View {
        CropArrayView()
    }
}
