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
//        // Crop point development, comment out rest of body
//        CropPointView()
        
        NavigationView
        {
            ECGSummaryList()
                .navigationTitle("CHOT ECG")
                .navigationBarItems(trailing:

                    NewScanButton(showScannerSheet: $manager.showSheet)
                    .sheet(isPresented: $manager.showSheet)
                    {
                        // On dismiss, will likely use for
                        // cropping scans
                    }
                    content:
                    {
                        ScannerView(coordinator: manager)
                    }
                )
        }
    }
}

struct ViewConstants
{
    struct cropPoint
    {
        static let diameter : CGFloat = 35
        static let opacity  : CGFloat = 0.3
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ECGAppManager())
    }
}


