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
    
    var body: some View {
        Text(scan.personalInfo.firstName)
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
        //ScanView(scan: <#T##ECGScan#>)
    }
}
