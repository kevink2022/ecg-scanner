//
//  ECGAnalysis.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/21/22.
//

import Foundation

/// This will be a summary of any abnormalities found both by the machine learning algorithm
/// and by any medical professional who has examined the scan
struct ECGAnalysis
{
    let healthy : Bool
    let detectedAbnormalities : Array<String>
    
    // Inputs by medical professional after looking at original prinout
    //  (or image of original printout provided in the report)
    let notes : Array<String>
    let foundAbnormalities : Array<String>
    
    static let standard = ECGAnalysis(healthy: true, detectedAbnormalities: ["No abnormalities found"], notes: [], foundAbnormalities: [])
}
