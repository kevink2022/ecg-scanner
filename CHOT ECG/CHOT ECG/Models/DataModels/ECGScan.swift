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
    let personalInfo : PersonalInfo
    let image : CGImage
    let cropPoint : CropPoint
    let id = UUID()
    
    // static let standard = ECGScan(personalInfo: PersonalInfo.standard, image: CGImage()
}

