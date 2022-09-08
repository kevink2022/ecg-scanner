//
//  CameraManager.swift
//  CHOT ECG Scanner
//
//  Created by Kevin Kelly on 9/8/22.
//

import Foundation
import AVFoundation

class CameraManager: ObservableObject
{
    
    @Published var session = AVCaptureSession()
    
    var output = AVCapturePhotoOutput()
    
    
}


extension CameraManager
{
    func initializeCamera()
    {
        do
        {
            self.session.beginConfiguration()
            
            let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)
            
            // Shouldn't force unwrap unless initialization of device throws error when returning nil
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session.canAddInput(input)
            {
                self.session.addInput(input)
            }
            
            if self.session.canAddOutput(self.output)
            {
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
        }
        catch
        {
            print(error)
        }
    }
    
    
    
    
    func checkPermissions ()
    {
        // Checking for video so we can have a live preview
        switch AVCaptureDevice.authorizationStatus(for: .video)
        {
        case.authorized:
            // set up session
            return
            
        case.notDetermined:
            // request permission
            return
            
        case.restricted:
            // message asking for permission
            return
            
        case.denied:
            // message asking for permission
            return
            
        default:
            return
        }
    }
}
