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
    
//    static let standard = ScanInfo(
//        date: <#T##Date#>,
//        device: <#T##String#>,
//        ventRate: <#T##Int#>,
//        PR_Interval: <#T##Int#>,
//        QRS_Duration: <#T##Int#>,
//        QT: <#T##Int#>,
//        QTC: <#T##Int#>,
//        notes: <#T##Array<String>#>
//    )
}
