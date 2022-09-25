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
            Text(scan.personalInfo.fullName)
            
            Image(scan.image, scale: 1, label: Text(scan.personalInfo.lastName))
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
        //ScanView(scan: <#T##ECGScan#>)
    }
}
