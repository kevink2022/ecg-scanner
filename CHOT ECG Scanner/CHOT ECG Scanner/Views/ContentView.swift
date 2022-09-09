//
//  ContentView.swift
//  CHOT ECG Scanner
//
//  Created by Kevin Kelly on 9/8/22.
//

import SwiftUI

struct ContentView: View
{
    
    @ObservedObject var camera = CameraManager()
    
    var body: some View
    {
        ZStack
        {
            // Camera Preview Stage
            if (camera.photoTaken)
            {
                // Taken Photo
                
                
                // Photo Overlay
                
            }
            // Save Photo Stage
            else
            {
                // CameraPreview Layer
                Color.black
                    .ignoresSafeArea()

                // Preview Overlay
            }
            
            
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
