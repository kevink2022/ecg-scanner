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
    
    var body: some View
    {
        NavigationView
        {
            ECGSummaryList()
                .navigationTitle("CHOT ECG")
                .navigationBarItems(trailing:
                    
                    NewScanButton(showScannerSheet: $manager.showSheet)
                    .sheet(isPresented: $manager.showSheet)
                    {
                        ScannerView(coordinator: manager)
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
