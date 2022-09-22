//
//  ScannerManager.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import Foundation

final class ScannerManager : ObservableObject
{
    var coordinator : ScanCoordinator = ScanCoordinator()
    var scans : Array<ECGScan> = []
}
