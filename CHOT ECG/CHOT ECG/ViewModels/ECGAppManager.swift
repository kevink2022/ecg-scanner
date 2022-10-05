//
//  ECGAppManager.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import Foundation

final class ECGAppManager : NSObject, ObservableObject
{
    @Published var model : ECGApp //= ECGApp(scans: [])
    @Published var showSheet : Bool = false
    
    // Need to look into more details about how queues work to see if this is the best fit
    // for our application
    let queue = DispatchQueue(label: "scan-codes", qos: .default, attributes: [], autoreleaseFrequency: .workItem)
    
    override init()
    {
        model = ECGApp(scans: [])
        super.init()
    }
}


extension ECGAppManager
{
    
}
