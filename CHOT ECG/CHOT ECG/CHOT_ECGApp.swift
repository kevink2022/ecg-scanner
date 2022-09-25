//
//  CHOT_ECGApp.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/20/22.
//

import SwiftUI

@main
struct CHOT_ECGApp: App
{
    @StateObject var manager = ECGAppManager()
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environmentObject(manager)
        }
    }
}
