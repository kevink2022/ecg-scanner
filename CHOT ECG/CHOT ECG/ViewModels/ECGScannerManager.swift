//
//  ScannerManager.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import Foundation

final class ECGScannerManager : ObservableObject
{
    var coordinator : ScanCoordinator = ScanCoordinator(completion: <#T##(Array<ECGScan>) -> Void#>)
    var scans : Array<ECGScan> = []
    
    
    // MARK: Intents
    // func parseScan(_ scan: VNDocumentCameraScan)
}
