//
//  ECGScanner.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import Foundation

struct ECGApp
{
    var scans : Array<ECGScan>
}

extension ECGApp
{
    mutating func addScans(_ scans: [ECGScan]?)
    {
        self.scans.append(contentsOf: scans ?? [])
    }
}
