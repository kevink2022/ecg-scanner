//
//  ScanView.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import SwiftUI

struct ScanView: View
{
    let scan : ECGScan
    
    var body: some View
    {
        ScrollView
        {
            VStack
            {
                if let info = scan.personalInfo
                {
                    DropDownView(title: "Personal Info", titleFont: .title)
                    {
                        PersonalInfoView(info: info)
                    }
                } else { Text("None")}
                
                if let image = scan.image
                {
                    DropDownView(title: "Scan Image", titleFont: .title)
                    {
                        ScanImageView(image: image)
                    }
                }
                
                if let signal = scan.signal
                {
                    DropDownView(title: "Digital Signal", titleFont: .title)
                    {
                        SignalView(signals: signal)
                    }
                }
            }
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
        //ScanView(scan: <#T##ECGScan#>)
    }
}
