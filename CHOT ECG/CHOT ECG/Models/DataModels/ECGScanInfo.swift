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
    let date : Date
    let device : String
    let ventRate : Int
    let PR_Interval : Int
    let QRS_Duration : Int
    
    // QT/QTc, may want to create custom struct for this case
    let QT : Int
    let QTC : Int
    
    let notes : Array<String>
}
