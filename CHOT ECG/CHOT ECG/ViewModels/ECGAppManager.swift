//
//  ECGAppManager.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import Foundation

class ECGAppManager : NSObject, ObservableObject
{
    @Published var model : ECGApp //= ECGApp(scans: [])
    @Published var showSheet : Bool = false
    
    // Need to look into more details about how queues work to see if this is the best fit
    // for our application
    let queue = DispatchQueue(
        label: "scan-codes",
        qos: .default,
        attributes: [],
        autoreleaseFrequency: .workItem
    )
    
    override init()
    {
        model = ECGApp(scans: [])
        super.init()
    }
    
    /// When the scan completes, we send it to the server, but before that we need
    /// to get get the coordinates of the crops
    func addScans(_ scans: [ECGScan]?)
    {
        self.model.addScans(scans)
    }
}
