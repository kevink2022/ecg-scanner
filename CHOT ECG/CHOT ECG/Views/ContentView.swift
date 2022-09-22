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
                            
                            NavigationLink
                            (
                                destination:ScrollView
                                {
                                    ScanView(
                                },
                                label: {
                                    Text(text.content).lineLimit(1)
                                }
                            )
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
