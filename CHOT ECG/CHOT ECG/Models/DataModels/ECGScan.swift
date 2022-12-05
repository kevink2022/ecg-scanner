//
//  ECGScan.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/21/22.
//

import SwiftUI

/// This struct will be created when for each success scan read and will
/// be handed to the backend as a JSON. The ECGSummary will have
/// the digital signal data and the analysis data.
struct ECGScan : Identifiable
{
    var personalInfo : PersonalInfo?
    //var scanInfo : ScanInfo
    var image : CGImage?
    var signal : ECGSignal?
    let id : Int
    
    //let cropPoints : [CropPoint]
    // static let standard = ECGScan(personalInfo: PersonalInfo.standard, image: CGImage()
}

