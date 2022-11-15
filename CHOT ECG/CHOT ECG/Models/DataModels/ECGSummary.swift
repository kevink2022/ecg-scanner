//
//  ECGSummary.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/20/22.
//

import Foundation
import SwiftUI

/// This will be the final output of an ECG Scan,
struct ECGSummary
{
    let person : PersonalInfo
    let scanInfo : ScanInfo
    let scanImage : CGImage
    let digitalSignal : ECGSignal
    let analysis : ECGAnalysis
    
    // Needs to be unique
    let id : Int
}










