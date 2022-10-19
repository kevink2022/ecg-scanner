//
//  ChotIconView.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 10/18/22.
//

import SwiftUI

struct ChotIconView: View
{
    var body: some View
    {
        Image("chot_icon_long")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 200)
            .offset(x:300)
    }
}

struct ChotIconView_Previews: PreviewProvider {
    static var previews: some View {
        ChotIconView()
    }
}
