//
//  ECGAppManager.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import Foundation

final class ECGAppManager : ObservableObject
{
    @Published var app : ECGApp //= ECGApp(scans: [])
    
    // Need to look into more details about how queues work to see if this is the best fit
    // for our application
    let queue = DispatchQueue(label: "scan-codes", qos: .default, attributes: [], autoreleaseFrequency: .workItem)
    
    init()
    {
        app = ECGApp(scans: [])
    }
}
