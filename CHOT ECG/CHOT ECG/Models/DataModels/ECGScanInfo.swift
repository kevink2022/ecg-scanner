//
//  ECGScanInfo.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/21/22.
//

import Foundation

/// This will be the non-personal info about the time and place of the scan, as well as patient vitals
struct ScanInfo
{
    // General Info
    var time : String?
    var technition : String?
    var test_ind : String?
    var referred_by : String?
    var confirmed_by : String?
    
    // DATA
    var ventRate : Int?
    var PR_Interval : Int?
    var QRS_Duration : Int?
    // QT/QTc, may want to create custom struct for this case
    var QT : Int?
    var QTC : Int?
    
    var notes : Array<String>
    
    static let empty = ScanInfo(notes: [])
}

