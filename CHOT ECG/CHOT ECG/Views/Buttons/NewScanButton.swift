//
//  NewScanButton.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/25/22.
//

import SwiftUI

struct NewScanButton: View
{
    @Binding var showScannerSheet : Bool
    
    var body: some View
    {
        Button
        {
            showScannerSheet = true
        }
        label:
        {
            Image(systemName: "doc.text.viewfinder")
                .font(.title)
        }
    }
}

struct NewScanButton_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
        //NewScanButton(.constant(true))
        //    .environmentObject(ECGAppManager())
    }
}
