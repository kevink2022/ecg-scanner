//
//  ECGSummaryList.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/25/22.
//

import SwiftUI

struct ECGSummaryList: View
{
    @EnvironmentObject var manager : ECGAppManager
    
    var body: some View
    {
        VStack
        {
            if manager.model.scans.count > 0
            {
                List
                {
                    ForEach(manager.model.scans)
                    {
                        scan in
                        
                        // Refectoring this to look nice keeps breaking things
                        // If this ends up being the type of GUI we use I'll figure it out
                        NavigationLink(
                            
                            destination:
                            ScrollView
                            {
                                ScanView(scan: scan)
                            },
                            
                            label:
                            {
                                Text(scan.personalInfo?.fullName ?? "name" )
                                    .lineLimit(1)
                            }
                        )
                    }
                }
            }
            else
            {
                Text("No scans yet")
                    .font(.title)
            }
        }
    }
}

struct ECGSummaryList_Previews: PreviewProvider
{
    static var previews: some View
    {
        ECGSummaryList()
            .environmentObject(ECGAppManager())
    }
}
