//
//  ContentView.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/20/22.
//

import SwiftUI

struct ContentView: View
{
    @ObservedObject var manager = ScannerManager()
    @State var showScannerSheet = false
    
    var body: some View
    {
        // This is ugly
        NavigationView
        {
            VStack
            {
                if manager.scans.count > 0
                {
                    List
                    {
                        ForEach(manager.scans)
                        {
                            scan in
                            
                            // Refectoring this to look nice keeps breaking things
                            // If this ends up being the type of GUI we use I'll figure it out
                            NavigationLink(
                                destination:ScrollView { ScanView(scan: scan) },
                                label: {
                                    Text(scan.personalInfo.fullName)
                                        .lineLimit(1)
                                })
                        }
                    }
                }
                else
                {
                    Text("No scans yet").font(.title)
                }
            }
            .navigationTitle("CHOT ECG")
            .navigationBarItems(trailing: Button
            {
                self.showScannerSheet = true
            } label: {
                Image(systemName: "doc.text.viewfinder")
                    .font(.title)
            }
            .sheet(isPresented: $showScannerSheet)
            {
                ScannerView(coordinator: manager.coordinator)
            }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
