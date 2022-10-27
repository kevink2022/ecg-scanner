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
        VStack
        {
            DropDownView(title: "Personal Info")
            {
                PersonalInfoView(info: scan.personalInfo)
            }
            
            DropDownView(title: "Scan Image")
            {
                ScanImageView(image: scan.image)
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
