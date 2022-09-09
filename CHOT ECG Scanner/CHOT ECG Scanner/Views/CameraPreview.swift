//
//  CameraPreview.swift
//  CHOT ECG Scanner
//
//  Created by Kevin Kelly on 9/8/22.
//

import UIKit
import SwiftUI
import AVFoundation


struct CameraPreviewView: UIViewRepresentable
{
    
    typealias UIViewType = UIView
            
    @ObservedObject var camera : CameraManager
    
    func makeUIView(context: Context) -> UIView
    {
        let view = UIView(frame: UIScreen.main.bounds)
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        
        camera.preview.frame = view.frame
        
        //####################
        // ADD CAMERA PROPERTIES HERE
        camera.preview.videoGravity = .resizeAspectFill
        //####################
        
        camera.session.startRunning()
        
        view.layer.addSublayer(camera.preview)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        return
    }
}
