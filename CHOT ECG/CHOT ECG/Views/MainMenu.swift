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

struct ViewConstants
{
    struct CropPoint
    {
        static let diameter : CGFloat = 35
        static let opacity  : CGFloat = 0.3
    }
    
    struct MainMenuButton
    {
        static let cornerRadius : CGFloat = 15
        static let strokeWidth  : CGFloat = 3
        static let padding      : CGFloat = 15
        static let font         : Font    = .largeTitle.bold()
        
        struct NewScan
        {
            static let label = "New Scan"
            static let image = "doc.badge.plus"
        }
        
        struct CropScan
        {
            static let label = "Crop Scans"
            static let image = "crop"
        }
        
        struct ViewScans
        {
            static let label = "View Scans"
            static let image = "doc.on.doc"
        }
    }
    
    struct Colors
    {
        static let lightBlue = Color(
            red:   164 / 255,
            green: 203 / 255,
            blue:  235 / 255
        )
        
        static let darkBlue = Color(
            red:   1   / 255,
            green: 91  / 255,
            blue:  159 / 255
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
            .environmentObject(ECGAppManager())
    }
}
