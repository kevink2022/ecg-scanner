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
    typealias Options = MainMenuOptions
    
    var body: some View
    {
//        // Crop point development, comment out rest of body
//        CropPointView()
        
        VStack
        {
            NavigationStack(path: $manager.path)
            {
                ChotIconView()
                
                ForEach(Options.allCases)
                {
                    option in MainMenuLinks(option: option)
                }
                .navigationDestination(for: Options.self)
                {
                    option in MainMenuDestination(option: option)
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
            .environmentObject(ECGAppManager())
    }
}


struct MainMenuDestination: View
{
    @EnvironmentObject var manager : ECGAppManager
    
    typealias Options = MainMenuOptions
    
    let option : MainMenuOptions
    
    var body: some View
    {
        switch option
        {
        case Options.new:
            ScannerView(coordinator: manager)
                .navigationBarBackButtonHidden(true)
            
        case Options.crop:
            Text("Cropping is not supported in this release")
            
        case Options.view:
            ECGSummaryList()
                .navigationTitle("View Scans")
        }
    }
}

struct MainMenuLinks : View
{
    typealias C = ViewConstants.MainMenuButton
    typealias Options = MainMenuOptions
    let option : MainMenuOptions
    
    var body: some View
    {
        switch option
        {
        case Options.new:
            
            NavigationLink(value: Options.new)
            {
                MainMenuButton(
                    label: C.NewScan.label,
                    image: C.NewScan.image
                )
            }
            
        case Options.crop:
            
            NavigationLink(value: Options.crop)
            {
                MainMenuButton(
                    label: C.CropScan.label,
                    image: C.CropScan.image
                )
            }
            
        case Options.view:
            
            NavigationLink(value: Options.view)
            {
                MainMenuButton(
                    label: C.ViewScans.label,
                    image: C.ViewScans.image
                )
            }
        }
    }
}
