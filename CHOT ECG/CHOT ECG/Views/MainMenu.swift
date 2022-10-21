//
//  ContentView.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/20/22.
//

import SwiftUI

struct MainMenu: View
{
    @EnvironmentObject var manager : ECGAppManager
    
    typealias C = ViewConstants
    typealias ButtonC = C.MainMenuButton
    typealias NewScan   = ButtonC.NewScan
    typealias CropScan  = ButtonC.CropScan
    typealias ViewScans = ButtonC.ViewScans
    
    var body: some View
    {
//        // Crop point development, comment out rest of body
//        CropPointView()
        
        VStack
        {
            
            
            NavigationStack
            {
                ChotIconView()
                
                NavigationLink
                {
                    ScannerView(coordinator: manager)
                        //.navigationBarBackButtonHidden()
                        .ignoresSafeArea()
                }
                label:
                {
                    MainMenuButton(label: NewScan.label,   image: NewScan.image)
                }
                
            
                
                MainMenuButton(label: CropScan.label,  image: CropScan.image)
                
                NavigationLink
                {
                    ECGSummaryList()
                }
                label:
                {
                    MainMenuButton(label: ViewScans.label, image: ViewScans.image)
                }
            }
            .ignoresSafeArea()
        }
        
        
        
//        NavigationView
//        {
//            ECGSummaryList()
//                .navigationTitle("CHOT ECG")
//                .navigationBarItems(trailing:
//
//                    NewScanButton(showScannerSheet: $manager.showSheet)
//                    .sheet(isPresented: $manager.showSheet)
//                    {
//                        // On dismiss, will likely use for
//                        // cropping scans
//                    }
//                    content:
//                    {
//                        ScannerView(coordinator: manager)
//                    }
//                )
//        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
            .environmentObject(ECGAppManager())
    }
}
