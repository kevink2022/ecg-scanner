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
        // CameraPreview Layer
        CameraPreviewView(camera: camera)
            .ignoresSafeArea()
        
        ZStack
        {
            // Camera Preview Stage
            if (camera.photoTaken)
            {
                // Taken Photo Overlay
                Spacer()
                
                Button(action: {
                    camera.savePhoto()
                    camera.resetCamera()
                })
                {
                    Image(systemName: "square.and.arrow.down.fill")
                        .font(.largeTitle)
                }
                
            }
            // Save Photo Stage
            else
            {
                // Preview Overlay
                VStack
                {
                    Spacer()
                    
                    Button(action: { camera.capturePhoto() })
                    {
                        Image(systemName: "camera.aperture")
                            .font(.largeTitle)
                    }
                }
            }
        }.onAppear(perform: {camera.checkPermissions()})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
