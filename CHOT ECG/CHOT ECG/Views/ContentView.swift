//
//  ContentView.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/20/22.
//

import SwiftUI

struct ContentView: View
{
    @EnvironmentObject var manager : ECGAppManager
    @State var showScannerSheet = false
    
    var body: some View
    {
        NavigationView
        {
            ECGSummaryList()
                .navigationTitle("CHOT ECG")
                .navigationBarItems(trailing:
                    
                    NewScanButton(showScannerSheet: $showScannerSheet)
                    .sheet(isPresented: $showScannerSheet)
                    {
                        ScannerView
                        {
                            scans in
                            manager.app.addScans(scans)
                            
                            print(manager.app.scans)
                            showScannerSheet = false
                        }
                    }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ECGAppManager())
    }
}
