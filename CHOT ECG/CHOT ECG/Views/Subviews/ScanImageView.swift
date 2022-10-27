//
//  ScanImageView.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 10/23/22.
//

import SwiftUI

struct ScanImageView: View
{
    let image : CGImage
    let accessibilityText : String = "Accessibility Text"
    
    
    var body: some View
    {
        Image(image, scale: 1, label: Text(accessibilityText))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

//struct ScanImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScanImageView()
//    }
//}
