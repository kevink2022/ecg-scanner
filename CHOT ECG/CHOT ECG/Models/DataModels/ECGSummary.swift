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
    var person : PersonalInfo
    //let scanInfo : ScanInfo
    var scanImage : CGImage
    var digitalSignal : ECGSignal
    //var analysis : ECGAnalysis
    
    // Needs to be unique
    let id : Int
}












